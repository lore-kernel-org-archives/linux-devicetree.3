Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D44D17B3
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894282; cv=pass; b=DYoAjK9g/VGocOpv3ihr19cwq5loznMg80c2CopoZXs+hMf2BO9veTHMKc5UyrI1HS5rJHDiWfSTHMSQvQSl3rUFXFcogbIatCSZQVgGCXdJkjOuyjjBTIAsPuGPZBWUCU4EtqfrF3THPyU5V8tMg277FYWZNrxmH2Y7o+DHCag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894282; c=relaxed/simple;
	bh=jUlJOAGscmKzGahwZhW1vZi2twtvH5CpgUlhI/gE7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD9tdVXckZn+Orshtjb9YEdFpNWHvokMonfYAOvWD/eYMLuYB5Icm9xMmgo5fqCYTd9dcMZfxwOX5C3Tp0j3m+Oeifr3rR+/XgOytNijaxQM/u4Lot1h5jtI4/rSmFARMzM6vKq+wtgOdKhChLhfWcUMg1kbVuSRFVQvm9K+dfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp7m5aax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPw/WDUu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp7m5aax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPw/WDUu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXxQ015275
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=; b=Jp7m5aaxYj2xkdlL
	M7R8sMwZwwJMzHikLYlGEXwmc4Z4MQBVEeg0ZCnfSXIxjKxj5b1k7WxeZcDZ5nIJ
	ZZ2LcpaeMz0u9gZpZiH9LPEJ5qYLCB/raFiSeJr0wczRVeVyzwNbh5l/630XOVtN
	IV4Q874QRojeN2KAQWAZjR7aw5fJ6cipK9c318fn+iD6RB9RG6gTcpkBZL6fvMTl
	QWWAWly1d7Xm+iEEx29yKpK3cAod4ncsZeXlxi5ZX1sy80+HMAL+ucqentmfXQF+
	MApnxasg/u01iYFGniqdZemDlXvn2Ny5s39a1hEIye/3oABV4KCEtjZF6yrFO092
	lSNIgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uh71a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337b591609so33148661cf.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894278; cv=none;
        d=google.com; s=arc-20260327;
        b=ESQIUPbGPnOLZegEhC+o/ielDJ3F/WvCqeyVy9gEAha/kKfcFVNk/pNtO83rpJTcOl
         NacAX8ZXfejZmUBvDRW0dNMuEq3jfT7ZNn0A1zuLq6tfOLvm13Se7SbrcUyglMlXCzxi
         r00aybziXLvUiH/Ei78w/YTUuW1PuTo6X/b9WJI8oLv3dv393ZhB6xI24aHB0+6dU33k
         ox13MoEpMQ6pHHCl9cwcaj78OZ5uQeOY6yBb1Vb5O0SkcQu83SAUYfnwlkU3XYBJEfe2
         Y7s2Bt1G0YbC6ZCn6rO2rVFd2/S9fqHyHNw0rspdBrjcZLO11oo/cAtDKmFpZmk0QVvK
         tunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        fh=/Wfol6i7P929LspZhlSPMg9RJ5WNBRidExjA4oEsg8Q=;
        b=B06iXTIXwprWbZFUPLt1zC99FXWR8B9ctvkDZKezbrBVyJmp3J7u38ipNWGecHcGS9
         LhChzymGOsawY+s1UBQsQyrIjYuZHYpmurkuLEHaU2O8y/e095BnOj9VPeKXIlDEfNfZ
         qnApXKOu5hTHiTlqD+OYM/8yP3QCswHo0ZYGwOn4ix44h99wNe+0UrhgsIWf1e+HlC0c
         GEmS1RJ21pedmr7VM2cbW2fI5Y+GX5vjiT2k1G0G+Ecus4bDI6T6+8PDc7iFGnOWQ5k7
         oujE0Lvh3yugHE6RTLuiXUAWvJHNKPMec0yx/G0zjbrxGOOhHcqmsyJmNuzbmldz49J5
         HNWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894278; x=1792499078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=TPw/WDUuZderJT2aqy6PMJm3j3giymVIjdm3fysctqOh5l5WnWxkNwoawNNJMkLaSW
         29NIbasby9lv39Idjx/snHxO1rsdJlUcdsNuLUfZnA6QSDsnaY2zfXNohhvGW/Q/prvi
         uTR1KwJ3m84kEO/gbC61kbFLkKvmikz073WC5DpDt2N3Tok41O0ZDvQSwupcDwDRHc/n
         6Y1DOo1murEzPSM2753YaQ+WqO3mF8tOaoqBiAEXvHRJXBBDjBZB2CQEfC6t8NwLZDTG
         +TCSrCkOj/ryUKOTG+3vRur1L+kF03vWi1XJCvyhg67LttgYLbxTisfIZ47Dp9D7O3qq
         F1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894278; x=1792499078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=qWMIAPZmeandyD5v7wEJ78rK/2VkFWoPgGpEVyu8v7pj5aZOeIpmKJKsH37lkZQ58o
         iXw06yw1TNNQW4HP/IzC1C86sAsbIyYljEcDxITzwa7pVOrJtyM6Xm+iotWXbxIGT0Vj
         /AguLeGRFSbKo1S+xn5WIxkAvjppLsaQa+uqdpKhuP42UBtp/bNEgn0AU5SWLbUUiByv
         J9LSgNoezOL2+qdfrWBGMsq9PyarhxZfTCp550pbg782pfas5aK17MfeCXRMyuWrPf1i
         SCwt3GzRlEsFpK5QogPnSv+rCTGNiCxQx2Jlv3D6o8kG5ARwTd48e5ibam3O4o/wrg/m
         ljpA==
X-Forwarded-Encrypted: i=1; AKwUvByHuJc1YZ1zwQxAOwG83aS5sHiXdhQ6jcnD++BZGmISsmc2e4/6Z8RMLKl7Un9oFhMV8pG30MDg5+1T@vger.kernel.org
X-Gm-Message-State: AFq9FYLSSaX+kX4Iz+8QBp0k5fzG69ZmkNIqLqGDqInXJtQR3+/fnNgI
	pT6a+a9lZLiNCgN+8SXiMAXpW3PxkW93/q6JE0yHfVXtosbaHon2vELPH7P5QDfFLnF5k7eArgh
	+47HpjcYEmZKNJpRfNs5F/TtbfzLrmP87MLzGNrKRckByCzmCHwU2sE1KUPzAbu6u2OUeQOkExT
	f5gec/bTQYbHFpaPZ592QJKdqgWHMyDWPbHVEyIyU=
X-Gm-Gg: AYBFou3mhNrJo8dV5EgJXkq9FwRUSWLNdFdv054meqUuvOuNXB7QBtSJe4ERDb4Tc1Q
	GVWg3iijxBWv2+y9AQxn0rjqBW83JVAPRYldlW70Vni1t4Oi1R4NCf1WILyPZTs8w61F/eDNfxx
	OMMX74ZZlTpQxaFfzvEBZkfnKHMUW6Pr0Y0F/hmofsHYrTeDbAmRH3k+RRj8911QEwAeJ1G+5E8
	MLNgGxzgfaL6TcD8hpylWidpBDr13AB7hKAOOj12NLv013jTHApCPWFMRrd5iEwptfb0MveXAk9
	9+2x4q8eqvwVSBJXqmAJwoFiSCyH
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-5359fa9087cmr195111231cf.20.1791894277431;
        Tue, 13 Oct 2026 05:24:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id
 d75a77b69052e-5359fa9087cmr195110711cf.20.1791894276755; Tue, 13 Oct 2026
 05:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com> <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:24:25 +0200
X-Gm-Features: AclHuK_DsaujXZKzgQcz6fY7MANZtkJtyyIAn3Pjdl47YmkPjme6QijlN0LMNHM
Message-ID: <CAFEp6-3LXSdAd5seGb1e7OZVYq1SFR+8RdK1Q6mM=2ZeZfM4FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX0IGXM4Zf0LxT
 nOOmU2y0QshA9xY118UZAIcl7L5mJYbOF7Y7obYZJRPKU+76/BWQIQJK4gjgI22Bnco8DGO2ELb
 VJ4jvnA5D8qDOlqzLpWQdNSgA9bdgMtj1PTHcrzXvsHZcxi4aMgzx3Csu8wAn7AnQUWc1yZCXNd
 arxPq722a7jlOYAqZIPxRnT+v9CYZvBNK8On5Aw0lgpDScRyIj6NDouaDAex7xSY0eTmUdcfUoK
 henNOo3AEBEPe+HpJJTyqpm50ffgeFcE9VypuLeiksDLIXvnrNvFn3WljQxr4V1EgWSMOsrswB/
 anFB1Dzght/leGavaKhf4h7iNMHugVanTy4QY2DOB10ZORyEzZI/2vwlHrsrLooCcF52/Oq3RaL
 URoXizPQbbasy8O0CA3jTqtfJqkin0Y4YavzbVdAoYuH3U/t6uUUb4zSSqC7aFTaWS9oz9W6ZpZ
 +COv1j+6NMcHtP8YQeA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace2306 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=b40KZWPJp5KrgtGOUacA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: vEovx9rI-JvVYeHE0-mBievubDf_-0cr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX6iRZtMzGf45e
 pWAD//ox717Bf2rmwafsqYfONv0tZvIqgZtqKw9sLff42fy0AxZ4SdwCX1gK9gukvkLE3hhoY0B
 Z+IAcm76J6xE2dfTc4OXpI4SY44dOII=
X-Proofpoint-GUID: vEovx9rI-JvVYeHE0-mBievubDf_-0cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Tue, Oct 13, 2026 at 1:03=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>
> --
> 2.34.1
>
