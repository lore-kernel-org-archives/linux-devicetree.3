Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504E48987F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483994; cv=pass; b=Ai6iasfb4pwDa955Apvwfqm/X8uDK2CKEE7CyIUuyeMsBk6Qbq98uASUitGJudXhuefVg83fU84HOEuXa5z+lg0xpSU7YFnvh5l2laAsKXGztITnpeoGMVnz6M3gbAWGBTJluF1Q84jV8xjbxHsN7lFc4MpFhBLWfaL9eVCG01Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483994; c=relaxed/simple;
	bh=LxEdnS3KVLoZ0weADLgk43qVwGcqDXQnjG948MTUH9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMQKzMAlH9KNv/GmYJ1CWHJ3Bvsc9alCzEUtT4eV4K2EW990vzNoMGaiuO7zCx6jDOxcDZH25/fsLUibVLl/M0NJfbpAMgEVIjwud11GqlNy34h0nDTE9q/KlygocrxR5S/v9s2WWed30oUpLu+JzdtRWsNzqU2Ni3e9jK6ogiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POKKeRp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EalK82H5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POKKeRp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EalK82H5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7Ki2Y3308482
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=; b=POKKeRp4fd5OS7G0
	Ul17dmZtpYKgCwAvyz2U35dLwOZgqv0WsXwD2OfhDdYqiSIvXtKWQ86XIc7jmk2j
	CG+/Q4C7w+jlc8LbGfpjF7eAk6eQgf+owNo+uWyZPxICh6zH14gVtYhmYtWLlnCu
	iy5K1HSFMKbB1iMD1V4Fy2KvXCpfxcFiiGxU1SM9ll1vl2OcOs8/B2rl+CYXFT0j
	DhGGdt6wyD6NcZcMVh4UDgSi/6066tcRa+f1/B2QF3VBSCKB9I49sngKJBfYzTcE
	M+xcwX2qIbxYPhJERbSfIFoD0ms2dE0IgAc3UIfXNYOPshOU/D5giduxSmF919SC
	Oyf9cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq7yr386-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:46:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b6bdcb4fso98105385a.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 00:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785483991; cv=none;
        d=google.com; s=arc-20260327;
        b=O3COnuP0HxLLitIM/+vjJrXSLGvoGPfQFT6vpMvxyFnOonfAOfvmtkZj7gvNlItuI/
         YtxJ/Zi06DiEivAtBt9WV30aXCSCr6rgU9YyjamFdf9xOjqjCTBfrnHGOGuP5tqW8/aR
         oLzNdQeNUjypzV9nNSQAyOCr6Fd4KDYFCEWC0CjiCiOyw3AF+2IAevoZF4GSkPwGiJ7r
         J+xfF/YU5svSIzCdxgS1LfK3JGgHrHu3lmpaIm/F1NeyWLvzTWHkl577M6EQHlj7fUki
         zWQLM0NRJztvVGQCbodRld5Rpjw+V61iA5F4Ag//lmsVKunag9OmwWXKm/R+qnfbG6EQ
         Uhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        fh=kZP+tKBBQHPoa60LeUB4hAwT6/KaC4xR3rwVS1SAN8A=;
        b=VhaVjt6AQyxQYCrWHBpNeNLqjqgKfwfIlGuRw9qKxED6uAEvUjMXZMs44G5kWrQ/FQ
         D+aMr7tS/ElKm96YAHFDj6RrX8i7r6C9TUF1ksL1Cf3GZ6p7uCmkzYP6UCDGT1cWlIJV
         3FFT9aYG0JNmxHH7uvddaCxapEdUuZv8gE8MY7K+MHNp4Cx52HUhAq5pFQAs/wBb6o1y
         vX+aCKdU1/xntEtwXZBasvJtHIYrTPXnRlj2RsozyRP/EcdmvpmrmSttwyczJXFEzc14
         GUCenQt2Vk5nG1xHp0kRMiId8Ujv/7Ir9D0382pcOmv0Ad++vLqXQcMjJVnWrdlOBNNy
         yYQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483991; x=1786088791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        b=EalK82H5mH6ABbdTqMLkSQ2Lct042V9xo8kR8tX61uA0jsi1uZMiyCgxEqiFLCYZgt
         3iBZTasfanxr6PAzNmr1ZuPvxYFMNvin/yNr8m1SedS0dXjkaTr/Gc5UagSFLhj57x15
         Dm24q6epqx0V9gr1XIrbVhnkF9qmTMLFAHWZrTZ3aKTuTpIuhCCjQ8XbaNjL6/3xYrNC
         Q2hdKbIPGxWUvx4t0uOJUpZrOelpyUMQ1JQeGQWalbpstqGEynYVXP4oQ6oC2ZtNkflg
         2OpuKf/lbRH7uLz5au9y/JvwEET/NgMCKIj1bULhowKzp1RLRymw42WdV70BcoMkzLCh
         6BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483991; x=1786088791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        b=KbIqilGsOyTdHqhiNQj+gl2BNREJRPeJmZfpjLmRgBZG85rI6N+1fX1+YxOcmtE+rb
         alnslyXG2xUGv0CynZ8q+hRLM2+GSjzLBPi0OP6zGT7YOqSGazZAZC+TuAmzpKrhXFd0
         pFr7PSGt+G3VuJCGILzijpZ3OwwcBYBUn71jJVMDdGTV6U4pgYEEK5M/cR/Y4iIVeEjQ
         PIF1f+BM3BWia/l/VfsRSRL7IOK6UE1atEDXBOuignTSQJaSOBRaVs63wJTw7RkqASES
         1SFYyAkkMzrTf4XDmmTU0gBR9xgwBUelaX7D1+OZK6iSHyPjAjMF1H53X9ZvPZsbr4Ol
         jhQA==
X-Forwarded-Encrypted: i=1; AHgh+RoKjx835HrE/O5TruMks2VFG39Oj9RnIT6dGRTdqj9FNcsdnCGFVwkkeRD4GJ5COgd/Gjvyf53Po+EP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0tMo2c+ArWEzYsUDYPcJovlDWSDx86kfgfdxYDiJqdDzLUXGy
	6xQHgantxDpj0e7BIPt/I+8e3GoGJJLfWMTpUCBmaGSUNs+OKrjY+RNDs/4Ol2CBOZU4N7wHZ+O
	d+d7xAziiCbo3T4jow+b3YoUj+IxDEgmZDoZaNypV5gX9UOl14Gq6EmDfXeUdhLsghMG9Ct8fTY
	lpNeKnepqIvoCmUHBGZhsSaDfxD/dVUA2kWW/vVILcYFY6/55lYg==
X-Gm-Gg: AR+sD11r/vv4olVNrTHnJHDnc0SqxBGXjktmC4Q0UaRpQHCU4vfx05ZPOlXwo6JrGAe
	pG8k4kl58Nv9aZdPKe7RvAIbFFY936JV4Xf9bqq5SydL0EDk9d+RKpLyFfJ6ODlf0/bfnmrN8FK
	UkHnDXTZJkclvF0GhSnaa0+xV2ElM9AAs5B7jARh9sUH/y3BDkbGuUrMWydx+g/PHkAT4VMVmbv
	2OyaQsh/bb/X+NLac3b3w7PorEiZ4vfhgfyd1+aKypeMpfDDPy5RtErbA12RWb3S6uT5lJ7ABU=
X-Received: by 2002:a05:620a:6089:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-93499a86db9mr66751685a.19.1785483991199;
        Fri, 31 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:91c:d0b6:13f5 with SMTP id
 af79cd13be357-93499a86db9mr66749085a.19.1785483990785; Fri, 31 Jul 2026
 00:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:46:19 +0200
X-Gm-Features: AUfX_mwN-1aw4wosaqJmkJ4ElLYM96H89U5sW2rwfXtiTThYO_ygewOGzogj5qw
Message-ID: <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BKSDalQG c=1 sm=1 tr=0 ts=6a6c52d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3sq7i5FBc_JC6iizDrgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uyXNucKx35BS1csge3XyRUnUigFKJF_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NCBTYWx0ZWRfX1TlqvA2OIlRF
 liTw0h/Ru9Sgx4ls/fiR6bLKR509xqBJB41oQKZL6aHX69QpZu+v84D1WiI7c3FD1HwN/BhwH+d
 /d3Dj+iCDKcmIUZ9kn9h8TqdH2MR6sg=
X-Proofpoint-ORIG-GUID: uyXNucKx35BS1csge3XyRUnUigFKJF_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NCBTYWx0ZWRfX0I62TpH21k3N
 9GkcCwBoDz4abblQGLVzMp/vjamqvQhg3XCoZuZ5q6JUdQEBY8ynp7zQNEEMXm/PRoAia6IXHwH
 ClmHpY/C4rdLsVonnRBu8YsQwvEb9TkWrtq3ptHUx/yuX469ICqKacoLJNF20M1DtKr6vdKjQdO
 Hv0rXTjdzlLhqmskM//qMqwmb4+Wq4BkNgdd/1VrMMqGV1Xf+1vpFZrPJgQOTHz+mDpU1s5Pyhf
 jjVECmME01uGk/YEubybR8bBNDrM92f734onmLWHw+MWZqF7vTkPKVBmTwYJyXmntsfZZUQy1hD
 hYKLXQiZKk8GVwjRDqGeZJj72YGGjs7Kr/U0cBDibv6JjwEbhmsz5pVWbM9rjiu1vSrDJ6pXsSO
 s49jphy4wNyDSq1vMUjMQR2T6vEKEbd8OByOh4VATki4248MthLiCgWOEPwxEbfzzFKnIKaPBFu
 lAeAn2JfdWCs7Dpc75w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310054

On Wed, Jul 29, 2026 at 10:13=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Setting CCI supply clock rate to higher value of 37.5MHz allows to
> program the controller to configure its I2C bus speed to Fast-mode plus.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

This works for upstream dts/dtso as the SoC sets a default I2C rate to
1Mhz (fast+) for the CCI bus masters, so the 37.5 rate is the right
rate for it. I'm however unsure we want 1Mhz as default and still
think we should avoid relying on assigned-clock, but until a proper
solution lands, this simple fix/patch is consistent:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index a64922c21267..a14e11d81488 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_0_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
>                         pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_1_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
>                         pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_2_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci2_0_default &cci2_1_default>;
>                         pinctrl-1 =3D <&cci2_0_sleep &cci2_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> --
> 2.53.0
>
>
