Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262743B4A0
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284543; cv=none; b=Kpkr9GMLNjAzCd9roee45NYeFFWw14o6PhWAGAGpfRlktuY7ghtUR7BuLSOpAhzkpH0JcHiG+pFbgOHcWBZosE412UlrJB6CCInzfBfwwZup9ikdpNEabNgbRmg71c2kJKPeIv37Xjo2mEyhiXfKlT5/LnktpzdbZN0GlwUWUvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284543; c=relaxed/simple;
	bh=CUWasxVQrQ3vRZe5x6RDKEwxOSqw5rBQZJxE4EqiLgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDqB6GOOSX9tKmAC1GH0CsGbMNYzBwDj3xgLvZnV5SpgQGb+E4hlRWyhagoDKYppnlSTHoYx9Pa6cWcDIzACXdrRNf2HetKo8P1SIQxkrKdofwqRSUxAWboS4KuZPNouWteKDdm9leNeoN7btY5JggZFldjHjG9LHTJ3fO2tpJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTvV6QV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up9FNJER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTvV6QV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up9FNJER"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIe1NC4151273
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=; b=BTvV6QV7YdPA2Wlw
	QqIRO6/PYju5u37Vhc3XZ9HOTn06vi8hPuhveajHU6xI0lVYu0SEKbgiSFtBjUkX
	uutwbQK8ZASpYCANq4pCBRSzMLyKa015/uk0X/8QcHyAq5r72dga6uzsIgkj/x0i
	pOd+zhWBFw2BzODwALED3hf3G+C52BkW1Xu3sDOwBm3EcFKomIqlT7JLzEPdZhOe
	JtLvxrx5K/RO0PWeV7JnX77FNwUAoZ71NEan4Y81IejN19HHKW+NFoDRvyplkn6e
	XNAJJaa0lmKr5meQ2WAE9vf73PeAbIvo4KalRueqR3/mYoEt1qVOPoSanmhQYqWk
	QfkRuQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874gv84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso481042c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284541; x=1790889341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=;
        b=Up9FNJERnA8HaufR+y/t8TSKUbepGZ0FjOTm5TlSEOrIVBb6jIy99C+ghzbXAIT8Er
         8PA1ejgbPfo7Z2TmirYAL8PNdqE2wEWkdE0kUIfA6QKQSQgQ6WwOx5y7Ew7AbOhhtxxE
         z5ptBwGJo3HIEVReMIbxo937xrnzVUuQAdM3aQZH0r+IhI9tO/Ol8vqSu3x6LcSOJCrK
         +KeTF9cJ+SHWlcWmQ/S1ugLvpeauMlIBCko45mO162nKLkAxXV7r+mztPCnF5B27526I
         NBQS+mcWzmqro8skLLeWw3HFh4NKX2xz08UG28P6xiwpxNesqZgtQCvBBnLQluHPLVmV
         G/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284541; x=1790889341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=;
        b=1c6eujzjIrdN8Z/tQ+IQVeqHZCwGMrohBimvXntz41hIZ6GxDOzX4hMgtw+dTmQ1op
         DMCu7GGdZWigTQD0o7qw8ykDmmtiAWt13Q6e8RLdMn6v1wyBGYbUsPDnLLckvqVRhD3Z
         9X7FoXHXH9tajJUAdZc0v6eciJIDgHW78jtot5uBh/22/oep1NsE4TO++KMzN12Et3Rh
         rqebbiJTJVIW5dtpB8ejtDj44G2vUyoXJhzdjMy1dyN+4xATlRvFQ0mmzb3rGP76+H0N
         +xSv8fxtciY6MVg3vX0/rAkmuDJDRolGHC9DQMdh+MVtbLoDLLdVvmmmwhHFW+HH3dWp
         A+Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzqDgPAk8d72wck+MErfmILrWuPhQ/I0Edrk1NTMbwMkKNtbsgTNSV/lNfwXSWeQljLuu5ksQqQMyiL@vger.kernel.org
X-Gm-Message-State: AFuF++nXJWkfYNpixWV/e4px7hB7OeneGOFbbHIo/+UvLRm6pDvhLMfU
	hUnVtbOS/QsdpDia3JHLcyuFoAiTwjxTP2NZSNnyrZFv19BfK57xWYMZdhYco/dEJO//11OxQ98
	W6o8uZOHt9s0OGdMvNm4epzsDqwR0BdG63I0PBRfUalkbKCQonAwpW3ywRQYm7brw
X-Gm-Gg: AYBFou3EGmxjtFRrjBBWpqjCq7XUT2z5iZoZu7Qp6VDRhKp7MZNcZBxaR/PWPqDQopd
	VLyNeBblyz1XbtMQqohatTgMr4P3tjfoiqPyCudZYIsu23y0dipIqZ17k0uooUagcdV+PtWE6tR
	gsDy+ZqD28JQRy8PkMm5t1MTpXoYGDvb0dEch1LON66PRKZyYob7qRO/nxccRj8XEvY/W5K73fy
	rx1shV5MnFM2kVWK+lB6nX+dA5oQdYUGD1U82pGkQbMI+ffHn9lCqPWRb8fF7xwQQXKBsG2IWUc
	sjFgec65hNmHxoWboGIaGpQLBsOGtpUAkdFTwjJdXl3n9Fpl/sbabaY/rsZPG0xVWu9UBbVl3YV
	Ash4/AIJ02HcFJWSaa8FzTaY=
X-Received: by 2002:a05:701b:4306:10b0:143:5d6f:5532 with SMTP id a92af1059eb24-145040cfd94mr2743793c88.40.1790284540734;
        Thu, 24 Sep 2026 14:15:40 -0700 (PDT)
X-Received: by 2002:a05:701b:4306:10b0:143:5d6f:5532 with SMTP id a92af1059eb24-145040cfd94mr2743773c88.40.1790284540113;
        Thu, 24 Sep 2026 14:15:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:36 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=896;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=zcZQ01STOX/BFxpjfteZ5GbDA/SstCruTcWAzRWOPQw=;
 b=qf5WmuA+flC64cCXlsBjTmkpfQFtpR3zTefYrtkTx4i+d6SPJXuF5PLCJyCt1DKDYV3vIsh2z
 h7RJ86eK1yNCynUS7ywf8obGGXSmuuceWuZ65Z7lQC/seu9JrUHBztx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: oBFYgdQa7jZ1yaWlehn-GrQ_JwxRzbUC
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab592fd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXwqYZNac8z7oL
 ZMCcDkgqYedzvn6pLabTeYMWBVw4EcZwF0Nex6tDmwO17yfNWO/fEdWKIG9eKntZhKWH3zWenxR
 0l8IkLFw9kV6NhnshzdQB+KNNC8Da08+5hMKUr1Xydz+eTLJQHIDD5DE2LVUZwdQrYer0KtxcVL
 BsQU8CpMZElzO3Cd0HPtL8G/SLzUjgIklnwbZj1tSTULW0YNXRjn2XMUaymd/VP6MDiGwiZ6zHL
 3zt3uIpQ4oHTwjlz2vuRQ3SZ8hP9Zhf/x9WcmiRW4FRM0TiUelz2sg5FZo43BTDn6dP0Q9Q/48q
 olLOrxcb7mxPjd/bLtcnYJqO5/VcAl8NAyVkdRGoXCghr/tikPjEjk3NqUyhIHSWXGPaIfve7W/
 WrDgXoRSW/1oH9mAq0LSRH9UkNLaQVfoxWnbzUErwmoUsUr/eE1SVuf1iNC4EwoL1HtwFP0/W35
 YzQ0T+FBvnPI02q9DmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX/g0I1TIQ+rRS
 p90EpWu4ha3Vw7eUu8mx0u/yijpIqP7dsVUjxr5gfC8JNU/h2Ty5MszgqCq3svkHWYo1FTMvcmG
 TiEsUj4baGnyEYRoNDYFv/N/flBYTWc=
X-Proofpoint-GUID: oBFYgdQa7jZ1yaWlehn-GrQ_JwxRzbUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
of the Adreno X2-90 found on glymur. Override the compatible strings to
correctly support it's GPU and GMU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e..25b40c33521c 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -127,6 +127,14 @@ &gcc {
 		 <0>;				/* USB4 PHY 2 Max */
 };
 
+&gmu {
+	compatible = "qcom,adreno-gmu-x285.0", "qcom,adreno-gmu";
+};
+
+&gpu {
+	compatible = "qcom,adreno-44060000", "qcom,adreno";
+};
+
 &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };

-- 
2.55.0

