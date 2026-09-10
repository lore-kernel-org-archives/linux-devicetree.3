Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2FC4BB282
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056346; cv=pass; b=j/u3QlE3vUY5M7P0D3DfjW2v/nzo+5R7O1Iw//bCn1BccjgneIw54gqfieJ2DufJndn4+cGKs4kGtPcZ2Ektp7tE4uRA+N0zOZ0Y33cwQDJKaENTLb8MGfb/sTBjE48JkBljZmPZw38X2sNZLi+PansBy5+9REvonL8Nn1OhAug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056346; c=relaxed/simple;
	bh=aBy1wp1XDgJgk2FDHwx8cZ27pYMc6ljfdd5t3tcQcWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlMxK0jboUWExvV8OE+gpZabPqVBc7EI4bFpNyFvwY90VUWo2HlWUqLGux2oju2d3p8xbb7LaQqv2rAkrXcUnpiU2Gqmd0EB9yvAR8TgMC88jkoK2B0dmTaHxD5JoUfHSEql3DiYS17P/F+1VF+6XBU8eLe9LkIYb//Pg0PwfBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd997f9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlNXqFhx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd997f9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlNXqFhx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4W1u107100
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=; b=Gd997f9xtHHwFcNK
	ESk2kaXCnE7PChuTUrYr3RcjIX5qulDIXd4042yQkQPv1PGEwzcf4NA5C2PjqDKA
	VU3c2x4mX1MZps4wbENVRTO7f5e73qqF4n+DcNaPhVVa2yBz8Z3zUTWcaQz2pFX/
	nR7j0xtubkEu1bj7WgORXBC+VyHc4yB+oEcEar016FyeMnDmf0eap5bv0vcfVXKe
	i4bgE3dNGVaRICb7KrQboVxsHlaDfeCBtVBWblzTuqWg45qxwjQgJdlfn5HMeA+/
	kXENZlnTL2OJh2Fu0sVgwWT9PtgfUiqNLmN3+6WTyXVG6hOxx0ZxK9N340jzBB99
	w4MYSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8sx05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so3234788a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056343; cv=none;
        d=google.com; s=arc-20260327;
        b=bUD/D4iPZcuLoH6R7u+eBcO3GNRsuk4QULSX3/H2/XqGtAc5+RbnAeBwM6PrYOdmor
         JOuBKRx0UxkgRoku1lXppNUR6VrphMg+RKUv5WQ5iJaPVoiP4ByhPJOORUX0teO2Eqqc
         Aama3u9OzPn1PtIrAd7vzVcpyiYhAnYNSDDNiMmI+bPrfUpmIZ1cGe98TDCUd3J73ag+
         XPAh4PllXhRo9uveGOwp7J/2iaY8bk+6bRq19gyOHft4uJG60dLpOS2+6JENXToGCD+u
         A07mjkvAjbmP+0E3JtH0hMKCgMlhXVko8/L3cBU+ZBcWR4S3XP7f2k4XtNinZp/sGBNW
         0yEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        fh=WLXTbOcb1yKFVlXqHL1PxTe+v6GzGY0KdKJ1gmrSSZw=;
        b=GolOx5ySpiwSbPhWWtyREP8a6DBJa7xmio7XUiJIW0lBCpWSq+mJHaS/FeWSXwzsm0
         hqDe7eab06dMe3KhiIdS3p/yr4uIwvS2nSQXYSJy0gHZu+hIIJiLyYZapiy0IDMUJKzl
         J8t0Dyzy+Ppd7dDHSpTxIjHqD4xr26XMZLQmA+Rzk5WpI+cQg2ih3Ho7Mp2rtuB+lYWF
         wB+qdoVpjmxspTLDr1i747BTcYLmg9ZG2ybW1V3dDJYg8jieE+kmLIFVCirgrx++53Rz
         FmSSQw1Sh5wSVwW9igFkryVpp+AD94YTTyi6Fi8EeyAWjstI7IiBL/UZ5YieI+2jvkc4
         jRcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056343; x=1789661143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=UlNXqFhxUHKhCqL4fNI3V7Jxr9f/1utmGP5GVMQUxT5DOCvVdAJDcE6iygBEP0AUd2
         2A8Oe0wmcWub7HfgE3hLGN2D9iJQ7UQ5GH7xn0rk3/tVheJylvNV8apmJl6zFN7irIF3
         8DiKcP8efCA41qKvks1e3QbGIMIp0S5uzckn2rggK5bm+Vis28oM3hvUV2dAMEpngETS
         uk/m56K1eYoIH7MUV26MKEPuLbjuZT10SHBXlKHPLjGbP1IZDIbQXMHgielIeaLdlVZE
         cWAyUBrw5UNGkBoSdjFkeM1IM50kdgVMl1UoK5E3n2vj5tVwcThOvAFGPloGHvDkqUAx
         O9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056343; x=1789661143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=bNFj+pV0c1ySa0atlDI75q37C4xBUxnPGLr1d7YME+g5cylk0C++x+/2tSbl6QCw9a
         MN7CjipsOYtyTGXEwwsfr07A3wnXUxGaKsQanI8jtHoaKtIuSTAKlekD9ejp3ieNCq/m
         /aC5gRzdxaO3+NrZPqAYOh4AGh8pbviPTrE02aoBG/cJwXYOyAG+XiYODxtUMabzVNuF
         o5myba3p/mU/VpaXBZBar3t4hucguRxhTv7BRqg2oaNez1ylnfghe2zW/cq3k45Wor0o
         gLwK4Yks/zlJ29wQBfI/LvnyylTsfzW/2uysHzkiYu8P4fXcSHxVTJY/1g1ys5I6xLyq
         B30w==
X-Forwarded-Encrypted: i=1; AKwUvBxEUzYrFFU5xGJ6QurZeBSDlPth/YuGvpnS5wXHAYy2N1ltdYJMbXTOYrkMi1kqPSozxmaSmogkdJjG@vger.kernel.org
X-Gm-Message-State: AFuF++ntMPEhDCKepZVC3W5EniRSUYicL0Mx0YiBVypXgLgqVx6/ReS6
	pBNabiRmlPbV3kP6Rds6wO7/u45dGt1gNVN/xaVW/wSd1saZemoJiHFoNfEfMpfn969OIdDKtEv
	h0QTQ9/gdKIXOPurJeK9Wps1hlTrMRH3I8syqRR9CYE4kxLg44EVIDsh+CXQO7tmMC9wwn1NdUn
	pCR+9jfPGBFaqSYzzs7N5E5DQgCTs0+B5iUV6NRdM=
X-Gm-Gg: AYBFou1vCSAAH8vjPSbVPxtO99NXb1uUo9gzhviS3nWHkalQUCNA6HwKI7JLfrZgaq/
	epDTamhmkh23pz3sI5rDspm/FGFS5JWFwyLzZnnRCoAOFjBkelhHhyWNyivO7z1iwnzY6T949rS
	7QEFDF2L6Mk9uU2VMgjRzyb8ewnBU4EunZ/xC0CJ/VkBQPUdb14PGxj79Tow==
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39d709e6ec9mr13852678a91.1.1789056342591;
        Thu, 10 Sep 2026 09:05:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id
 98e67ed59e1d1-39d709e6ec9mr13852578a91.1.1789056341947; Thu, 10 Sep 2026
 09:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
In-Reply-To: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:31 +0200
X-Gm-Features: AcwNN1WvbHnGQHe_mStODRAHYsWnHQkMBnMABj4Ua6z5LYWNHvR9yk0WKmoWbIw
Message-ID: <CAPx+jO-mQ_zFdpUGZR5FJYNdJuJ6EUyRU3-uO5zmTPdjH+S3+g@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Document the Maili compatible
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: E7n_ArW4AiLWhAz1Yy9b-ZtUp_ynXOnO
X-Proofpoint-ORIG-GUID: E7n_ArW4AiLWhAz1Yy9b-ZtUp_ynXOnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXwvYOvvli69oC
 iKQpXjA9dl6jlLT2X74kc+xNU5wLu8/Ljc7izXNQ0KdVWSKou0UR3KdQusiu4+tTnnEtFGxBieW
 A7RMtcQ39HU4JtHLojv92N+MnBGa7vApLNTPWpbdTB4zJ0BVuC9rRlNzQ6L6Hb/YpzqUM6j1n7F
 mzAje1tW6BbcnI8I6IMIWCK+wV267IgPX2nfN+1vanFc+/32AsyrkTsxQG3ULeU8Re4qMIaZNfp
 BYZKizZnee9sKXsHiW86G/80NskBZaFqSPydWmAoLK5oSuwnZJz0MeSA9Y1annSreRiq+d3kMEg
 clVqdfFtrsG/QkPmsVkKkpxYDPVR0whz5vUF/Wk/sEvpVP051sDd2zHClcRKyA9wQT7SnKf0Wwv
 AiHMP5fufBAC3ahMFogagQ4Fq6hxqYY7HiCELSbGPY7n5oXGpJ7RxZObRw6XeHtxW5xVPHMVIjl
 Pj0LPDyJ8T4Isf4nKXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX+H0NpKoiu1xS
 M+IQk/6DM9G7Dy0JCewiRdrgbA0/QKLJRzgxNGJZ7pe2eqrca9aM2ul++bL1llgbDTLp/mXt843
 k0tiM0UzbULBXQEerrq+2ax7dNVD7n4=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2d557 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=bLxP500Z3OXyVcFfUPAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100195

On Tue, Aug 25, 2026 at 10:37=E2=80=AFAM Nitin Rawat
<nitin.rawat@oss.qualcomm.com> wrote:
>
> Document the compatible for SDHCI on Qualcomm Maili SoC.
>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> --
> Changes from V1:
> 1. Added Reviewed-by tag from Jingyi Wang
> --
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index b3fcc1673c10..69bd44e65ad7 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -47,6 +47,7 @@ properties:
>                - qcom,ipq9574-sdhci
>                - qcom,ipq9650-sdhci
>                - qcom,kaanapali-sdhci
> +              - qcom,maili-sdhci
>                - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
> --
> 2.34.1
>
