Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4D3EB816
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584892; cv=none; b=fh3kiZxyrpGNhZtCKY5rIACfR2W/WfxCAh0XCETU/NLzf94WHIzP+wiSG3zi/HcCgjdfJol42mVgZti84YtkVB/bx1CVkriZ3hk3Y2gElF556d/j890+H6MeNZod9oN4Ukz2GvtZLEn5Y/X5nBcaXOG5Fgs54TeZMJIEi9ER71A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584892; c=relaxed/simple;
	bh=jjR3Z29mlqw/oycaES/VAzcY9tU1jYKDUkP6/rLhE7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LesSrmZHosoWnNM032zu72MM5hWwPxw1/mk5DFOCHjd+X+Uq6Nx0fea8ofC6xsngRw4HjdTyiGF6GLHXrnjMmLytJ/rHa5l7tWf4mDu4KGIsLjZDwW5OqwP3hhxPnnjHPyqzGzSvMGjZR0TkPosYLa4Bvoo0yB7PabV6R4ADxLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkrF6iwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dprX9vPm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkrF6iwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dprX9vPm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960G68887939
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=; b=OkrF6iwxmlGHiTEr
	uSnAEHgkKuyhNmyzEGGlgSdVdSI5i2d0H6rasuMnrD+z27PsJajk0ofBGwYKNlpM
	5yDTVl9ae1rCnCAjj/d62exGStjU722br5p2WSh56VGAayJL4quJcIMgOdWarpWr
	WVk0zTs10duboh+CEbLZZ4HZfmmiecRy8fq0Ob9sAJ+4abk/8vSKHEnE+kp07L3g
	myxwxuue10hGH0KQ9YOPE0HK4szsHjRzrUi6ifJ0HSLDFQVpv6FlPV3MxYIjJ8gx
	BlD0lY0f0hCGnHTKMaAMrR7mYaXr9RUlgNDJ3k861/s+FUkP7cr5SuX6g21fRUq/
	6VPIww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33g9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso1450163a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584884; x=1784189684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=;
        b=dprX9vPmeXjbla3XU8sjPVfA2fnMlSHAV8/vF9/N/CMcgJanqnARiT8oKYGXj+UhGy
         Kn2XSwDZMICwAWCNo3Ro9K3jOSkQUB2Tlpras7bkZ3f3dNa/bmADE/CYk4K/yVBLIIPw
         UZFQZMsM29pX8C5EqrHwlyF0NCWpaN0JSPrYV2NhWZZzyuptqPck0ljGEpt0qtZlMn/L
         u19VENNWti9AdAnAaPmjosalBURlDOfv/IW4Pm0Qd0rYUCOalTFOOGLGTOLhy34NvU2v
         5YenmHGXVZwAbCTbKwfa8y7GEt3Z3WOOxmGLSV+Rlna5vb9DaZdCrwhTNII82/gdm+aC
         yDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584884; x=1784189684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=;
        b=rQkHpRLtK2wmK5l3txOimc2FZu/JYFvJUUC+dZyV1kZARnq2hpUIL2t/9j2yKVbh7d
         Pt58IeBWjzW3TiwcTxI/+rfs/0oIvubYoSu+qalzZ3xeTgrLw4wDNJBO8y9Ts00nHdY8
         /6sS/GSMl+P8XQYtj4cjk9H5JER11LnQ2B6neCTMDuYZ8CKDZhDFYwOnXWXCxNJrbXb/
         ORrtAslqXtrp1gYwdPilSv7bP+BDgaix35eQAAuOR9EO2emrAOYLe6XqvwOH0pH8TNb2
         1F1RJUO98RmBBaDyMESmH3LS+WSJ9sm6pJgQo0bS7fKKwUBg6J2k3Vknobc8GQfinnKD
         g7zA==
X-Forwarded-Encrypted: i=1; AHgh+RppQoKJAO0tOWv4GCz8eAtDTKqGEcLqZ+a2UPkFN76rI1y8zfqIbo/pNvF5iOHGB94VXh4p0txMRT83@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44Flll5ErCYxUzmlKgvvl800c+RnoFf0CWzImZqitVt8A9jIk
	iAE0U/tFd6MKinmFAY8ynoJQsaPTvjMb4KMs9TZvgwV7WdIa5dKoUNsYwocJ25P0PRZlQJzSSN4
	LHUFeK505H2GBPL3NkoYht4YaYIGK/EIktD+eV1ymg7QUVIlYp2ZMqrmEqH3VW4YU
X-Gm-Gg: AfdE7cnTrMm6vLW3cOUihjWInWRPZgGHC0x/VpU/Z8hj4gZyFQdDDlmZ1v3UfUweOvc
	XhHEUoVFH7Mh0N+WI6Zv9ijWrLxppRL1v0xzqyX05sH86Lig+hGqlievfYfL2czOTX5/VePgmdU
	DcEj+QYSSLRaxpBboR2OCVnwnrZ5fzwqRspJY8kAsaZJd6k5L1vo/A08JaHSZtjfvb0bgap2u+I
	dP9MnaSyuvWrel7zfGK3OE8dEgSnATbBIvvlySO7MRkV7Saw29x/ojA1tgot+NJpPwSmbkugaNk
	EDgtx/78BjU2VCNa2p+bARBiYGNEjDGByfjaTXb61ATdCgio/aCVKVKUjANnH7cau5VdSAYYK0O
	PMYRhE1aoVp14DZS5jOZSz1/J0EjmJnpT4/STKbXgKQblpx0aWGVoiYz/3wvb+Q==
X-Received: by 2002:a05:6a00:a88c:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-84842fa0325mr5494666b3a.37.1783584883559;
        Thu, 09 Jul 2026 01:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88c:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-84842fa0325mr5494645b3a.37.1783584883117;
        Thu, 09 Jul 2026 01:14:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 01:14:24 -0700
Subject: [PATCH v2 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=730;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jjR3Z29mlqw/oycaES/VAzcY9tU1jYKDUkP6/rLhE7w=;
 b=hPsXP+g/5qbAwFzO2p9gW9jMXM3n1pFag1B1loWS9cOey2FmRWjAPUMYvym5nqukakb3MuMn4
 8uHFNa0GyMnDSnxGdVTiXG1w0CbHuC2YbHix42SODrVHrxp0Vt6BEGu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: FSJNqOOiW2Hiy8ZM01aiIXndH_dQbJVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX5T0xZ9+db0t3
 agOApmNuVPxSRniSFFtbHkzJCBWuWeixAfSRD7gPscGNlFmtW+vDp0gXyALCFQSPLCnlg2hCRcW
 +DJI7nBwfrqoDmRvEGITSFN/B7KqE2jk9CYtz9MBw+NATCVihEpgnWJ3r8gl/SR0+GtY9DyhFCp
 4kqEpovhBWTDd67SLFWcHKZoUuoiaN2A0iYlOWEWiOKRonWQFdcXDeEGrSjM+AjFQ146XdQrt19
 NCxQeUOazvauH+xKOnm3nFiALavdbXd1I31LBm8vu+klJF3kEK9P2sdiheADmGRYDc/WJYpcx2H
 yHqJAk1n5Ews6ZRYSop8VXuY2F+n8UOwvNGIxQYK2MZS5bA8xP9Y6CIIoFBSWwFG3D1nRkQt3r5
 uCXvSMC+jyP8sFALNp973zq7Zm1RS5qo8uBm6eLtWB/jye4sM2+ycRuCN/JXoBn8D31FA1z5UTX
 QgoKuFQOYKseeDDjcYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX2nJHhlYbOVAu
 Bow7vWOhODxbeU75xuyRBuo6wVx39mMN/bnvLgjLm+39waCBNOJKN210vud2vSjOm/IC9xrbo2o
 ahHFPb3yK9xkEC+UG67HZFKpLYQc54U=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f5874 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ANFwC592Q6juq9kqITIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FSJNqOOiW2Hiy8ZM01aiIXndH_dQbJVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090077

Add SoCCP node on Kaanapali QRD board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..8ac1c664a7fd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -786,6 +786,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.34.1

