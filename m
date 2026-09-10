Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE5492E5A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047024; cv=none; b=LUpC0SC1V/nC3wQEd8/kS6N/90XkvMLGD8hWTILMvJv/2D8nehqJwN/M09Kjl78dxbh8gFq/3eRi+52EOWg/mMESEnsdhDysN2pBcQJ+2hfJiZBkyVEjXxnYgR3vhO54J7UVSo8SVbeDlmp9ogvvFviz7LGFnXtXKYlI6Y9X0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047024; c=relaxed/simple;
	bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8DMsxpeRoPFVlcKrIyOOo+/Q/c0JUITX74/SlRR0ZXBRK3+AqOq2c5IpW7yLLJ3LCMn4pEZ0CwygZES0xIlKC+jjm5ZwOJ/Q2J2Gydka1lo4BHK8Q2NwtkkU4bSWg4zW57feOA3p8G9B/ZNltKfaIFVWqLrLTWFEdbVLzLsIvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQJxHuhB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNFt2f3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQJxHuhB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNFt2f3V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hEc918715
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=; b=JQJxHuhBcVlJsCgh
	lajkaQpPtzEmWiUnstavxLhu1Zpuop4oxgqnhDE7ErrJHoeMqA/78oIAm2A61eGR
	4opCnNfFxTGA2sjRzRmnKYAC7jU6PzfvicZOr8VUVB4AfxzsAAvwvWlh8q3X+Pai
	O20vGg36F1EFYB6H+3fok3DMUetOuRXYrx5zXZ6YPNadlBMcbUbdgc1GiriN02NO
	kjAhx7z3+n7LUETVF86CiQ84a/BZP1LiVsXxSRAtItuuJjNlGUUdwEaaXhxDL1Zk
	YbKEPUPdsYjruqtr3qOibn4zxZmyFPfUx4a91GXPVdSxCLp+5L6zFcdhGNmPbKS9
	cS+ZsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso8696609a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047022; x=1789651822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=iNFt2f3VFM1zuKXc0+cOZe+4xDNymnlycy4el1iKNbnspPe48zENM2KVH61K9scYRr
         iWH+cQmd1w6hK2hkhza5Mjss3Ppa56MIhVI54Wih1O6uIIiCgeSEv6hNPM1wycF1hSsN
         BW56A9pHSlOm7QgIL9A81Y4DcVfEEZ20MT24rC4+oAIgumW6GrFG1aEboYKdt8bLJmIV
         Ng99YrHUbF0RaMJlJ+LbTKF9guAQ/epaxinJhq3LJsXX2dOcMfqCT9sYZaMzCrBSUnij
         osGLwiqi+j66cbzbIKONY6yvZ+y1Y1sEYBbWLwU68grOVwUvmdpu1uB3h7skw/cCT38u
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047022; x=1789651822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=RIIjozZQ81gNBJp0tGvNGcNaeaLQh1fjxzh9VTa3jtX7bazGP4dyt/f9Jf9gK7iGJV
         /8EprGkseXer0/btfxcLPhQzaHFJkjDa4Js/AgpjLlrgKvy+xU6YU859d987lW+XEhGF
         PMuc1Dg/xlttBgIqGYqCWHoGwV9VjO3ALCmEJ3vZqlq8NpMrCLtoHByXtAQlGnG8Y27L
         c9ZvUWhFcVXirOPS8CMtF1HfhA2AarT7T3Lrw6MMzlS5XFOyiXcs+Wxow0VMnjFJ716O
         GElfqJqB7dMa+EBps7RqcR28lDwomemBPFK+PMWV/FP4K6rDRKTHgW7XdIUgTicUQq1a
         Tr8A==
X-Forwarded-Encrypted: i=1; AKwUvBwh5W+znRdhlTP+knsUKe3hkKCUFgVAccCpo9Ifw1ZfuFM9UPT+czagodISUO+CVlRXzt9Ogt0QTC0S@vger.kernel.org
X-Gm-Message-State: AFuF++kAZzzbznTyvs6LAKyuGCP/xQ1iMm7yrC9K9UxyF6iI+4O+jStu
	Y0IwT8pv44DDc+hMsPGQIraNVa7hgC7V423FGumKkw1ZcZ3fszihElnJYuezSIUsnJPdtIFoBiX
	/PEPn9/Mhrq69mLA8722C5Gtfrvrs+YdM7ccYNiFRBCpBWjXJHUvIPiiDqw+48kfo
X-Gm-Gg: AYBFou2N/sYPwmFA9i2fzVENzoc1sHXYscZTQdTOZTHomwjuLBfJBvdvIm4R0lhdigz
	MHzh4X0VgZYM9XpbXjoY7p8ndf8PHr/RkU3oNHOKIGmHu5cqsWBoAQVx/I4ZZd0KEIdlE3TCoRI
	9b9i01bs1b+yAhSSksQb7jhPtQrY+Ua92GYcQXdZSdwPjyrlDWYtUc88bTl3x0xuCFwgd2FoE0X
	BmQBGyCUpl2MJUPwZ/km57f9ZknLk+Z0WQ6Vjlx/mu//6BEDCJhS5FIUGmf5ssxm7KMx21So8i6
	lcyuzvANXlCfAAiSjtV2jiNPSt+e7A0tHSiAfJjcSHMSjpSbYduThpP4nAue8Qjk3jkHhu+BiwE
	p1+mYkdlnaGqAtrmSin2WiJXrZ6sZooSAyAI=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr64030131a91.17.1789047021786;
        Thu, 10 Sep 2026 06:30:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr64029997a91.17.1789047021098;
        Thu, 10 Sep 2026 06:30:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:06 +0530
Subject: [PATCH 17/34] arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-17-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
 b=NW+jqUahwmrBL226gTHopBfuXm03QjAeZdyvFynUT+D32H7LvvoXye01UkSnso7+Ncnr+Zw6l
 lpmzBW/jO+WCSksOxzdqsr3A31ac21BkwVLKGGlyDUFNCuw7dlUbRz8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7GD0Xj1liQ0w
 RkpjsfRT+0CC1cOqUE3BIawAPeUdTKi6XdFEzDEi0zkoQJ6GxoLY5I5no5O81CayLsuXBXP+xph
 nX0P8qocbbw9MuUdhS3RXQ0uh7BvuWpkD5qPreXXgOhaF8i9+XBGXUwx0yULLxv0IFbQoO+QWPO
 9LmEY3XOs/6OKsPZ8NB84c7N/c+vJKRWUwMLP+uzJ+mFwvARoZDZLwF6cCNzMH5UPwFpXnBc8gG
 HeeiKVtpdaop575DHeknJcrRzyPk7H4/JokUQc62w2II0e8Qme6KD7j5h8LoIZvj719VuU3BJNC
 WOPneqPdg/2wNu4takUOpjCmcXGMGd1SFo2FyWywkEA8ggqkF5y89t4mfLLBjUjyQSgpg7lRV/Z
 kGa09z+B8K5LpvytyNLZZx37EyAcWpOTMnti448EZloZZIx+coaKHVjS37JgbqA+JIzt0DsM6zQ
 b14628C2NBpGUKaaGYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX485dhxLiC0SM
 VoqmivrgpuSWiDvAxbVh16C5cs+7UDNd1LEdVd7isDj5y5heYSM6yIIz5Rffgg8RlHnPPEc9N5X
 4lngpiBXZXEcKYgtw4TbKiGbRpL9jKM=
X-Proofpoint-ORIG-GUID: GpqdVN3AZGonwCd-Yo3o4zzPRGTMSNHp
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GpqdVN3AZGonwCd-Yo3o4zzPRGTMSNHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..43f110ba3a7c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index a31bed7fad07..198f656bddf1 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -367,7 +367,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

