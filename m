Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD83F12DA
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525787; cv=none; b=pf/zTdISqEqGtXkiDcnKp2zO33v1bPGGRxXaRxlLFKX/mxgb5wfaigTzRmtUh6MPrCnt7SfSGzTJHbW/pFlOoLyclwkvWivLv4msXNaRr5IQi9zrQKI37cmRakVJymPVYxuuBF30YjpqipS3OkQEZ9lSk5Ss7uE4BoCo3XZFZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525787; c=relaxed/simple;
	bh=B0qAMxMUxakLtjM29Uge2pBkNuWyrdgF54ZAFwO2Vxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jF7CHGoF3UcA4617Pl1HtNBh9ZYeQNGzxqrnAarzqiq2ohrPfUib5q27+8unq/iODh4/2leYpW9cQ+JoqEke92aE7srEXgW6pTyL5uKph/fMvvD0NBq6FajLQ33bA60KSISGLFd38FuFSAUR0tJ3IEvi+NRblQVWIYyx5DAR7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIE6YVKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pxd7fEo9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIE6YVKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pxd7fEo9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3vVg2751621
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=; b=hIE6YVKFRIjrWhg+
	eVfDGwinmvp1U0CgWglKin7iM36Al3xqFkjEqyI66wAXEasxFyAOdi0Qk958oAdS
	31UqiLo9BDv5f03ZYn/uhzskZ/fz4DMaPYc51FegtHWpO2YFkAI+XgpwEvcdOGqj
	qeTvOCyNkD4izJNeXF4LRkHY0S4Ef2bUQbpdF+GeDJgxHTNb8cm909ToTP/feV0z
	N6A2Cpgs/LcPeRP0zXJJXFwcEbptxumYVw3NZBrP5cxBw/NN5eVLraTgPqhS+Ga+
	L+2HMEux4PKL1V7Btn0+AUJhq/vTwbCw9TjGggIT/I4+DXVO3jtHyR8lGBUkMQEM
	UnGXKA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu93x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:49:45 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-44cb04dd8f6so1011552fac.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525785; x=1784130585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=;
        b=Pxd7fEo9GSfIRgwgJ9p0y9CuARRXm/gn/uBcC8fFa1z6T1ikv3yfVV5w/WPvyc2KVZ
         zlViPJmHoxpR9vpzk5+B8VKUsKsHFXL7kdiygFhllC22koD3rPqfF5FxSbVEiWO82NM2
         vBfnZuwEmHufxE60z25c+6KU0imOiFeb3bkUram5jfrVMeUhNOCTMr78XJA0ebb8024Q
         d0yiwyS2TaJk4f+5mO0c4HuE5Dl8lyc1zwq1DPgf2Zq3beBIXFs5dyZT7SHNqmGRaEln
         GXO2cQfsw7Cy9MeKliXbZokXCjqlZBAD2Iy77HyWq6kbv29hDQqO0MibScacLCTCMwBD
         3+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525785; x=1784130585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=;
        b=GWBcLKgKHh5oQ16EB6YCwsSt3tMDewxBfOMM4zhh0flKjRm0nKHg+U3vOvOxfzxgBv
         UTJ4rq3Zsh8zn+3Gh/qSs0PH2cTDi8ff2DaQUL4Txjt6mERBOdwdfgOaYrQ9mfnMSox2
         oRVieA7cxiWU/MWxT+HZD/xSeoEa5DwZh4isqMqu5sf2yHblIllg8rFT3g8wYq4FYD4o
         gCilw/XO+Ow+JpECWSMKhZq9kKZGdI20I1d5q1aAe6/rJWvoA4uNTRz8wnt3KePC6Qux
         +0CoVMgd7pmaQHkbQIawWrQu/0s0a4k09Fb/KPQL3dnWd/3UWWRVXKea3Xcxh7Z57u7i
         Uszw==
X-Forwarded-Encrypted: i=1; AHgh+RqMgzdWEmbt5ZkbEym/QBwLY8iuxaG+VjFoTYaPfRLs8t1oI388gVnP8c9qovdlozzx9gm4IYjwNQRs@vger.kernel.org
X-Gm-Message-State: AOJu0YyrFIooVvsAtCiwhMIHao3eB0BTfJXsMjnblVVRqqCDY5n1wYd2
	CKULNE12eULjfux6CiIj2zMwVMel9y4LQANb2bXykeWDbqDqL0VYm0kdzsju86EeC81stiFNk8z
	DDcYPuJlQgdrzRz+XE4RSqJGb6CmPXjpC9us9DB/Z5pGetto3WPFjH8s6sRdo6Net
X-Gm-Gg: AfdE7clqkUo3zBvllwSWJu5uX8FpoQHJRHwQshc/u4iWw6n7c/4taaRDs01ISHB/qwz
	4hgf2YxVAdPnHHmOGFRjRK1agpuLrL1weseS1ficvPw071vR+PrbtR+wkXZhHhjCu6d4XZb49qR
	blGLx2SMcOhy7lgO4SX8eFeYBSWX8APykEnAXBfN1F8Zl9J2zevtKhBhpEW6sp1p8TeAaTZJ6hD
	ZHn45u6nBiUoNbevzi1O/bU7DuechhS4ofiZ04MqXDtiBp+3hn2rS8n+W7JNevm2xYxV+aICfZq
	ndYH0aaXsonoM7HDzPYstbTNz6LkOVOT38c1OJMUD9BTrVRR8zEcADsXFfWRwHTroFD8G+zCEpo
	5rHUWQ/ZgqxGmwIGFKvrl6fzrHucKMZahcBPgY6DV
X-Received: by 2002:a05:6870:231a:b0:440:67b1:b59b with SMTP id 586e51a60fabf-45162e399c1mr1784166fac.0.1783525784551;
        Wed, 08 Jul 2026 08:49:44 -0700 (PDT)
X-Received: by 2002:a05:6870:231a:b0:440:67b1:b59b with SMTP id 586e51a60fabf-45162e399c1mr1784147fac.0.1783525784134;
        Wed, 08 Jul 2026 08:49:44 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:43 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:12 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=884;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B0qAMxMUxakLtjM29Uge2pBkNuWyrdgF54ZAFwO2Vxc=;
 b=Nn+bmF0tdQ8WrBXh2CYVLaCFL/LoFR0Lm5No9JE+PQv+N55ncp5yRqhDJeF9sLe3jKoLJ168l
 BQe3/FU6D8SB7exu5wx6oRNJ3zSc4/4aCfLwcu0G0fexPSo3MAKBO2B
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e7199 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX9zhBH4jLOGwu
 TUI7E5ZfeNPDKvYBkqBT/K3lzSNRCGApQtNnevlNkD1FH6m0VBAaKSw8Zx82XP5Hl+KBQPTVTPa
 25O9vbn82uW8EtBhGwRSqXuwc48Ux25O4jHbfha1TDMiokCD+tBOxZwcUIDQnZaqYhEBYuq0gvQ
 sRITKkpIKoMbDESkE0aIdT59BbsfAQi4MR6LHcfhNVDlrm0tYh0e9Gz0CJtA4dTIg5gEJMwqhKx
 vcGdwjvBXacVhM3RVhHeocH63DKexhP1uNwupZZaAK3xiAlGGCa2c93pdLjFYY8pK3x4o1AP1io
 fOSK2oziAN1oCZ+CyJCWuqrly5D8OcQLCzP/KIR1bYQKsztbhNYag7YReb3YUSPp8JMQl5MVMNn
 JO8nLXvfaKz464MCML37YGCDiQokfPBER1EHgy399y7YqDsh7FGd44luc5+j5DzWpXiAFYBDM3C
 yH8up1Zj5Twh2QSgoLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX5q4TaYY1zYae
 /WkUyAhSojYn+SpnYodneiZqittf/CWpypYKvEvPQm1vHiYRS6BXwe9+CZ3o/0LVDsNm+4JauU0
 QoXtFZiJxkvxLltzbduDZ84M0oMIA4I=
X-Proofpoint-GUID: Jq53Nq63Hpek6ZSo-HfxmyFXHkoG8Rr4
X-Proofpoint-ORIG-GUID: Jq53Nq63Hpek6ZSo-HfxmyFXHkoG8Rr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

