Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC773845D0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479697; cv=none; b=ERb6J+CwVOnB3TezkwseuDf3K/9BEImIwpAkC5w3ySx9zvQ44NkPAehTEFpJVZg+p8HqZfD8Hl85PTD1ICI6KU09i+tGv4mGaNDZd/qfCUFXj5Iqd58ppD68xAEir1nR7YtGCjZuq6w8Shd++7SDxrdxWL0m8YNfBhtTxHBkPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479697; c=relaxed/simple;
	bh=UvmAXkOf8HrF3l6BJrIdhv9+2SxA39m8PzqUXCcyi6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9j+J3wXSXif3P66VWaEpS0G2i5ujp69kgjeT7XT20uIyowpxVq+AyEsAfbXZTE4UIZupC9q6w4h0gPy1g5V1UoRvvvg91rRYitC5CVs+TOQlmjyhtA1izCrgHtYtAwal/glJsEN1Gvd3sjpq+5TyLT5Zrfbe5xjlrx34SQPPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqpsrVmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIsVzMHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqpsrVmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIsVzMHY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOhTs4007112
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=djvrU1dTdSj
	oBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=; b=JqpsrVmxmjocGbEH8tQUTBViHsS
	aBylPapbI78rQXq77hvIC7Ymk/XLje3R7rOCPf8ZY0mIgzTPd1vxW+3EY6GI3JMa
	K0HTqAnwiqQBjH5pAKSyHF1TZTIiunk3dWuSOeAQa8+Qv4/7dNNd0j9FII3akH2m
	EYCMy62HERFBWXFSqwdjQMTHHP0v0/qh/YQ57pWdeZ+3fnIZ/D0Q+OrcTQjpHRvi
	AEmoWjcDp+QlSuqttkI09C1c3UxttCawNVvRZ5id/m4QmfrJDwEitChwUDU6do9g
	oXGElXEblb4e8TitqL7o+akllu/MUYMAj87I9uUywTt8JjQf3CZZNqKItOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd00a65673so57629785ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479694; x=1780084494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djvrU1dTdSjoBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=;
        b=aIsVzMHYRRnWHHxh4+5ZhHlgOSGYRdPvFGrp6l4I8DlFdFbJDkNUw0rJvp24kXhXJQ
         0ZwDqnBWaKVBtQBpb5syrEGevFDlM5sYkXbLsI0COoqhiLv2P2EBDvyowifDQb0jyWjW
         judiBDb8qTb3XeZ7YB84FnW9abPVX1atMKCHQskWhcIjEEozkboF6YiS+Knwtqg60YEb
         768osUc7n0/6Y5fozNr/ibQ6l8Bi2tLrknp+Ki6hwFSsJ5MXkWWLFa8bNqLKm41laIyt
         HevIH+AcLKP1B7869Ajmofh3b5FLuFO5w3C8F1SiqFjEpSndAVfJXc8c+h1J+S/lNk58
         K/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479694; x=1780084494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djvrU1dTdSjoBvgK1qQQP8eniHhzDVX38fpjF7rgZKQ=;
        b=XqDCdpJAmUgNDorf2jWjG1nfIY6RUnUZnWQK0tgTxb3VEtS3jElaoKjnxp+QhDccV7
         e2NjSQ/2+fan1lHXD80Ia3mezv9nkSX+Hh+UxpcMrCCLiccw9lIyODU1QB43Qj2vyCdz
         jkK2lKUp/W6BxU6QDohX+bEYltwTNtLcmvQWV57PfpHxTFiZM3VNsZ7yvjnBl58XMr9f
         yV/ulJ5b0su6g0NCdlf/utOGiA/x5f9Lg2Ng+bZzPoSg0N2WcZs5prptZ3ccId9AmwOg
         ntD63ujHGfvbN6tU3/N64XuaTh8ug8Z1TRpenlsLSLWuj0SiVW7rgVqy7CpfUEMRBlPo
         sazg==
X-Forwarded-Encrypted: i=1; AFNElJ+Df8FefAoWMi/50N2jGX673hgEO0HFA/NnVOOvAUYc8tf3ld7BWXys1BSwk+T6swiHZY7jfmTPCB6N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4409AQmDS9KJcvmQu0Pf5e7pp6dzotSWOhnCFVNfZIp7XYMvH
	6zGhnCqccZGRfLLGxuCz/Y955LT2iAA8grD/Lh8yVqHscIdlkHERMkZt+eQ6faC99jG3RNHGFlL
	p6HmWqKpNFsN0d3zP60/KhbtfIt0jFOcKMOsSXlZ+k5+WLpZR5qVswUtZ9jYOGGgx
X-Gm-Gg: Acq92OHaijnbRmu/oQERTOHsX6moFC7KdAYBrMnqwq3pbGkKvbRfo99EmJI96CQcszK
	kQ3VOeDgz9/xMqqrQOyuJOdtykvSj6mAvrbhO9U5TAdL1Xa68I/xV903AXe0C2QxracsVxiWn91
	ylQJFCfTpo/KNEHLIxCLWaioxWc2yO597syxH1I3Th6Ris/O1VmihXOSPG/dxPzPLkqyFLH9F2A
	Y0eIopBooOvafRnwpPl/mIbXdLlp3/5FqHzX9YH+4OMh+wW1RdKxgcIpUjFTXrJF9JUi/fpqwuv
	WOlvC1WqsTfDnCMCzQ8f837HCkOsn5XiejxrTV6GkSnk9p3/XBjC1QUjCt8E6L0ED7BIjpW3McI
	jnSt93r4BEtwcTLzMX4NQir2zyMKTXxd/IW/WV+VuHtEWl3en
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr85251515ad.12.1779479694419;
        Fri, 22 May 2026 12:54:54 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr85251195ad.12.1779479693835;
        Fri, 22 May 2026 12:54:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 13/18] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:04 +0530
Message-ID: <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX/0yaslSuXus4
 HqTnNf5HAdSQ5hVWqlMkvRYhTzmHoSzsz0kXuurCP0/9+gEigTvjvUBKEt26m/SWn8TJYRAMtIG
 5NgFafFVzMI2SE54jKHFsda9d13PpT+W2nm/98dvss7ZvHCADlPDUhzTeY9WhznMItvoMr28UhM
 6/x2TYlELjzJOuuw5QTyCujkTKm597P7W5l2VtSqL0a6xzSUwLhKGDmF0Oqew2oY7s2og7Nv2lO
 ZVp79PFi24Qmn/+rOl+Z3UOh8f/I75TxGi7SWz69RIFrMY1rUv3YMQgUKPSSgN2ZaVqOIcVBMnt
 0LciJOr1xL9ssIF7O9q+aoaNDXXKaGOfX9pw9uDTQ/aDkg0vaiCjOMonnKzIXOQGd6WGvAL07AH
 0WsrKKgGHEScxwKhKRBtrgUQMuv9uU6YsX7jbSWGzp0Cd077Fbdv24RRsuQKlqa9fbyJu+Dhpnz
 hwlOD5bFuYA5sQ7GvXg==
X-Proofpoint-GUID: LmJKWnt-Zv1-qe34vOe5YmZ5JCLTWOMr
X-Proofpoint-ORIG-GUID: LmJKWnt-Zv1-qe34vOe5YmZ5JCLTWOMr
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b48f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..dea97330da49 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -293,6 +293,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8350", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -3451,6 +3452,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0

