Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FE348EBC0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331222; cv=none; b=JXpd34Yyk8c8ERZRZmdYbXbrk2s3k7S4lalbvjJ+kaFiR4Gt4HagiZBMnKzn13ydeZJp7xdcXgrheZo7Bg8QMlc5MydLe53dOCdZeI1UnuNZ46WO7f2H9Dw3bclz0eCFNnUjz7qiDIAfob0eLaab8URqyLDsEVhgSx1UwZxpCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331222; c=relaxed/simple;
	bh=kj+B1T4aLCS/nzuyqzbwSZ3BJPr+Sze7VYEw9AAD2aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGP3WKSNQy9dY5mj2dsUE/UzmxQlKAQnuJafvxUE+JU9xCuwehqJAyAszmbCIYQsg7gZNPMtco1qcFm319dj5DwSrKWZd4/uSQ//gB/zsYTk0gH2J3sCh94bVxfG9VCkTtHg5UPo+X/n8i9t4picRNn8bf43egEEr53qKbrS9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Y9CNY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyHV+spk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Y9CNY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyHV+spk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z7Eh209928
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n3vTP1V3Fah
	npFShyDWIKuDXZUTyfor7i7UwWOsQnlk=; b=V4Y9CNY6MuvPz+Hi3QcZIeVd/J7
	Shpzx7ochWBMI9PvqUwlC06KoPwWxX4sc5kx6qPzqi3l6+A+YRACHZ/prURgv0z2
	o97mQS3y4XH4hKmApLwCjb6n86KhEjAul5piK404MBHcuWoMw0XY/uMZAApOszmO
	THSlvQwdelc3ZPyFaNGGltfXOpVvAJVhvUNTAxbuySQjI9zDMj/UMo4o86BuqWqb
	jA5HYTwRnyA3ZTb1jOGm+uizhy+q5QFpa9nj6Bm29pv5GoTx7fmmKMGA/Z3AIj9R
	vUGvxOLyO+dNGaQlymdsgR+E5fnJnYu4EhFyOGQnwY6jO7Arel7X5aQ1GsQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898u227-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so809490c88.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331219; x=1790936019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=WyHV+spktk/m/swqSPAcVFhumw/kPhBumxDmguUzTFFmHrWilg4BgP6OW+jr8Tn7iB
         /Bs4/I5y8hBjqBCiRdVVcIvCx8YIPvKVdcfhL3sKtTyenvdSwP6lZipOpbeM1Y4VIVY4
         bIek9YS8qSbBkY1oyK1FaMVJhjI43BBdncvcz3bJKUBE9r2YMru295JRkixmNIHCz7LO
         1ioWvJgX92FZyyg/a03MTBK7zNs9j59j+9Ngr1A4lXi9bBEKtqH0/644cV2bOIfj1wu5
         alU+n8y/Xh6x12iEFmxSD+1KoQ7VpIOrKiJEYoNaMXmV3/cL5WGB3nGHnsBVUBA1tEbM
         fY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331219; x=1790936019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=s0wIhmrPenuaXFLLimeTPi2L595NhgW8PvY2fHKChTgTVyIei3iIt19qG3h9nDHfNC
         VYguNb1vuKFuM9bg+o1bY1B5oMMaHqCk7BlzlQzeb5lJkGDXHUWGuTRaUxGpaTUTDKRi
         NpaAGW38ZaO/7sjJAagXEFne2mJ6PfbkpWhv0yy3ex0get2OnRC3TQxINxAlPTJiuPHd
         x28bnQxoRCq9X8SHOnK9Xqb3EDRVpXJtEp7B/Xyoe/25YHsbOc2H6hSAqf31TMI1p5Mv
         Z0eAfBZarYesjA3fD2tAgsOZpGNBw7HtEK+oa+bldnHfpa13GVBwoevgBa/CYu8/qdGT
         dapw==
X-Forwarded-Encrypted: i=1; AKwUvBx/Pp08acml2CTW1qUWtuCL2duLCugUkHErk/JG+n+eGC2ZkV/JZrm04eZ9HW18NU+h74oWE2nB4LU0@vger.kernel.org
X-Gm-Message-State: AFuF++mSkR9hNnM+W+WoDr822xl53Y+y0Gcp1d7rVLP6SUUzrt2LIGFr
	DfRFugJC/JrDXJO7FPrS833EUePWQqonb3esKe6svFJaOR0efYiirdtcv5KdXe+cC957TP6O3A7
	NnxffDB9OOEj9FFgMxCowqVe2mk5r8T1baY1gsHy+Z87SnOpP9TkoKapqms+ljsSo
X-Gm-Gg: AYBFou3/7vsFPoCfE83j21kcLQb2/MCqrZU273KHS3qHmn9DhLazNcYNITYj9IlEW7c
	6YyNfsxphtLrE9fxhDdx+SU5XHvwki450QBiPUNEjDu465kNzj9KqSbh1QTeH9iyyOL+nqzEeaj
	De7YqhAQAPsT7MMcGCXrHDhgE3SvZvfe72q2QxlPQdzyCNOQO23JsHrmQqsQXFpwIkJig9sQJSX
	vY2X+yhs1DZ9yT9XnfulhI3yMjuqbW+7+8JvFpjz1QsT2ozOsrXXAb9ntQnwREnozYvRS5kfvjj
	il+hfajhQkggObNTeVacuS6vD3snt1F6wx7MkifKlXFApZXFiG3ij/gDV0DFxyus0RT2Oi4aayP
	EpxsFI0XYZidjzOaORvs7xyT9VA==
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579146c88.12.1790331218692;
        Fri, 25 Sep 2026 03:13:38 -0700 (PDT)
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579000c88.12.1790331212990;
        Fri, 25 Sep 2026 03:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: hawi: Trivial fix
Date: Fri, 25 Sep 2026 15:43:08 +0530
Message-ID: <20260925101309.3826038-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX3zMUu6S68oYD
 h/1B78pI2DB1E/a80EFzkguSDHTzJ/+LpPzPGcdQ5tBDlcX6gk7AeckFqOqdO9GNh+dpSDCaAts
 O9BcdPTRt+2ep4dJ+GspPLtwzdSCrAQXVH4nh2seFkv29vKMk6q3WZhcFwrVVgYQJqI/Ldhmc6m
 DFS+Gu+2U8/ZeggOcqk4Mk0J7VyoKn+HCgzosv4fRHTKtFo4uG31MBMFkFlGEnjGuB/zW9EAl27
 s+UIXJHS5WCQS/bZIErtlYt5kKW6zRVxwxze9r+SVr5U77RFoh4xs/dVqRdt8FVgEy4K6V8n9RG
 HfUppcZqjuXh0w305iHaJP4rqB58uo4Cp9Tlea1OSpw7+YEzpWNqbDp59Zie7vsX4Hfk31y8X4G
 uB0rVuPoc6dF2JF+g5n3nxtFln1nUGlwrPi8y9Nw4yi5UfsbHFxq6Ns0MBphszIXRJZHXez8qVI
 UnVwTrqAW2432tjSDHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX8W83eKeIEFOQ
 pjb2UYYhJyctCZZE/FjziOwPNvBgX+M67CYEZ/vwfQxeV7J5+82ta8oI0e1FK0svr24+rIzESfe
 NEhMhMsl1/9bg9kFuHwiuaV5pCppDLM=
X-Proofpoint-GUID: 5X6nlq6dA0SD71H_jSzslbRQtZ4JZnBy
X-Proofpoint-ORIG-GUID: 5X6nlq6dA0SD71H_jSzslbRQtZ4JZnBy
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab64953 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Dodmwxs2qinD0bs0ztoA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250040

A stray blank line sits between the sdhc2 OPP table closing brace and
the sdhc2 node closing brace in hawi.dtsi, and the pmic_glink_dp_out
endpoint in hawi-mtp.dts carries a commented-out remote-endpoint that
was never wired up, unlike the intentionally empty SBU endpoints for
now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 1 -
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 88e0afa791b3..c38e5fab7a2c 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -120,7 +120,6 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_dp_out: endpoint {
-						//remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index d47440791479..6b0a0ff0faa4 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3295,7 +3295,6 @@ opp-202000000 {
 					required-opps = <&rpmhpd_opp_svs_l1>;
 				};
 			};
-
 		};
 
 		ufs_mem_phy: phy@1d80000 {
-- 
2.55.0

