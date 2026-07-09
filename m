Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92887404BD2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587158; cv=none; b=o5ZrPuRY5NS/zdX1twWdEbKNdQITMnU2DzGQYhmgo+6VXR4V64gTS85O4syqZazYv+oX/O9p87vHGnynWQU1Mksivg6agi5/5Emn2uPBrAk/I2TSEWJU0PgvyLD8fOX7aX5+VtZxQaHBQJRs2RuUMz59AHZsl8oFDo5Rt/aFLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587158; c=relaxed/simple;
	bh=mz/vbKEa3auNVvUlvqCxL4e+N2IxEzAXNSVtBInwc9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCov5dFnOvgK6wLQomPaDFDeXmpSNrzLuj8QvoyZnsb1XdU76FtSzd/cEK/G5HvhzaYxLFFAZbqHGRD0Km0+NadONuv5AEerfqZwGfBGAMMvqYI47rZQUApnYmXvAYB04+i+8J1wUFq51ms06IRsT2oRk+q0GkqxQMG24wwqLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3hwx5io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f08hPR2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3hwx5io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f08hPR2U"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Sw5750282
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=chKC2qFBTda
	4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=; b=m3hwx5iowjIR0CB3CCwPrF3cVl3
	l08+CNRZGObfPy93qerYZAWbk6dlr2QGEiZJKDE/7Z0I5URxUm07qLxOGLJtZHK4
	Ta8ALdSPKbQ/3wxnBgY1MeTj32Hbee8OhgcQv0K5RgNO95hA8ypAafrfMCAVw4+O
	LA3aQ6D3ztIyRImKnFbfuvDKtIHUxGBM3NzDWM2XYVe89Xy9JZSz9jV5f7hBS9xD
	AxxaQB/XvpnrOdY1fY1Qu8RgdK+rHkQJQwZPdlFoVWebiOrVqrVetFqHg2v4PWff
	T8qBm+XYQK5EMEEfzlMYrf4ryQotzRibocodlLZi47H18IK/2zc635NZ3Ug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft88r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8483dd13b63so1055013b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587154; x=1784191954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=f08hPR2Uu5X0Qhn1YmXB/MULAKjl0433+qVkHyzJeSoIBEn3BK5Sit3tm08cQ1thTt
         V63r++EYFv+ApznQ0IC4+uSYOQFCgetkuEFPs5zv6uAZlA3iBAxksQALNq26QFS/HLJX
         afwxWMf5oD7w7RNhk+GQG7GFaIwL78WiecTWPCEKrvXWHvtFbkRdV5fnzAxCUAkDH29g
         8pvmgzQjhttmYsMwf+GdVidOb8JFEGwvOYcJ3Ua5uJChEnWN9IgngjRX3WiXiwGX+fB9
         MLN7DmeVk/o2mhIDkO6PuWS0Kmag78kc/TNH9dC1toaZCY5mtoVpD9WKrB2VgUO1VU5L
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587154; x=1784191954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=AqyenheN+jqIfEqJYCwhnm3T8cz3pGhVW15+1KUkiTjtitXDJLbpXpwPcPZIPhxg7t
         r7uk00MUBWiv2d2+BdWC7ultVmb8D3sJpgyhufXrpWgTCDgzeDutLgKFn44XjRiM7SQs
         7RSaqf4FJRQThQGdM/QfH+V5DgXEAWq1ZXvDAislUfFW9DfGzJuO1Rr6sd1dvOye9DoW
         1dap8gckNLjgTkdu2sB6FDmsfrRviTy8qjS+eCFnFk70KXivPPIYl/JO/HTJ+5MuOzap
         J3e6r43Ntwd8IaiWGnM8pieafc6Qc2Z27jt/KZPrgifxkAPvrskjT1mZxgPWxyUU2b0c
         GdEg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3r8stb+3MOeMsobcYLl+3HoZrcSnxnXCGb7+rHyDDNkak6lmXMagueM7MTb3ayJrzCvy2bcHoVhtd@vger.kernel.org
X-Gm-Message-State: AOJu0YxHX64Q+XL8fCmdrp6rpWKHYfNL7LIus0O8v5+iv/PFCq3WDZE2
	UNjauWppCJp/RV+fhRLsZNFveR7lBhdY23UDN+Jo0JMReog6IYEuyuubK5JQ6TQdnf/eYdglC/x
	sSgpKrs7mbI0gkax3WbeU8PUunU+aZPdlUCehyaMsz2EsjKa8NnzVU5ywDREvQHnp
X-Gm-Gg: AfdE7cmnzJFYEzmjO0zSSCKf6uW+BB18k2Ncr9bAOmFMUUPESst67tJUPnV8EucMnoR
	1C3qkuhZgayHg5mYmmB23TGPs3Sfg2r1Fne7+0KatJzkcjGNwKqHnrA8poedfWkk8KTLFCmaj9z
	fYzaPxCei2eDzKTHIvXZkm26D+SNWkQiwrK4uqX5Xl3u+SQ0XXPsTATCiVDrdY0mdCMuecesb9z
	kzIrX0VKB94WTGRuAKpe6IUe9UybqgyfvNbiznSubUkbqUY3hKnV33gcIy8gowTOvXe2e1UVu0r
	L7ulqAVSYhCxtqXcHHWuabMIyv/POIp5z6YsKXOk+QO1BvpC8JGC0bpIg2bls2XpihrJgsxQCCc
	zC8frQL3+iWuXttU/t25o3ces76W8M0v3SA5vswWBAUyy2EJoRBQDFXQDdeYMVvKxTtnmFZk=
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786512b3a.27.1783587154320;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786481b3a.27.1783587153747;
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom: pas: Add Nord ADSP support
Date: Thu,  9 Jul 2026 16:51:49 +0800
Message-ID: <20260709085149.4072181-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX6hnNWbXqt5cU
 MBhSfJgwJHcjQxCHuwh0vmDCib7g5+x6H0g1m6AYOqLVIpbDiTsBWuz7TBCQU8u81Prp1C4d5aH
 8BN7GD7nPvLm/uRPQFUY4J5KiYFtn6y55EzMT8BrERlMv6YIknPwDlkfcKRzv/OBQEguAa1gdrp
 qSYFDBq4e/Q6FbULWGXgKy/G0SI/LLeaFVUrqJxiU4qMa7RnDTW2BtWCjN+o1Dar9G9oV4dB2BG
 hdYNnXT7qe5xi/24toRcXrcch+KQ7UKd9IY/88M8qFkbA4xOdKAKPkkengi18M0c+yds+mM/Fy/
 Sq1ZxR/tqkqy5mMOwDigDLrPETyDDb+6b+8P7pF/JWUh5OZ+NoXtN52X7ggAjnQgb6bulsH540r
 MbjU3neB2q61anJV76DunLJwCpPaczjruSOeCZZO5nSz0EIqzmroqpcbux1TMX6yksItxwEPtlZ
 ftAff5qaJMUlnB9xu8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5N9nTIBmrYB9
 KKDScDOhitw5WogWGIBHV/+R2cs6iQatyhXgIzG24WVTNYVcOAL2RELSH/vlyycIBgo6Gyg6GoM
 9ThBqGNHTPemOD7JjqkhzJIkxIlxIOA=
X-Proofpoint-ORIG-GUID: FdHFKhEGgipJXYhbdql0DCsSi3-ynJa9
X-Proofpoint-GUID: FdHFKhEGgipJXYhbdql0DCsSi3-ynJa9
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f6153 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qFrpwd1egEKAg89pRWwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

The ADSP (HPASS DSP) on Nord SoC is pre-booted by XBL before Linux starts.
Add ADSP resource descriptor, and set early_boot flag for attach path
rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..486d08e75cab 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1422,6 +1422,27 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1664,6 +1685,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

