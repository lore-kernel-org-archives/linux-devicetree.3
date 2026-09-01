Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0007B46E01F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249438; cv=pass; b=dkKpbW1I9S/PvZtlr6+hgEe8Bfr9DuSNScg/Unr23zLk+5Kr0oy/VY5xwO2kprHPUUHAAIyl5xPUi//arR4aMmGj3hj/Y1RZDyNV7RfDAvccfSkWagj27FJKVx//mHzUdfO7D0wgDMacjwlM4IXnBSqu6easkKyMAJVr9JEItvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249438; c=relaxed/simple;
	bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTHeGw+NgW5ZxL804DC8dJFbSQqr4OejLQgXFyrRcN7fcEdLm2cr3JuDtnYUdRS9ve0l+3J44IjAHp1ki3jaVv/f5nyOw1ekI6lZT1klHsmbsAH1MRia+roVUnVx7/VlVx+02doHCjbMY1P7Vl1Q33HYZFOvPISRnm6NlZ5FbAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/CG5LUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8T+pzgd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/CG5LUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8T+pzgd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Mrg1892621
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MT95TXLpS8p3pbuJaaLjnBJ6
	LWQyjI3YRFCLnSR0/wE=; b=U/CG5LUpyU0Id0Nz9vRevwpMevriHtEySFK1ORO3
	sx1h1N76x4h10pA5D5hXi03IXLlyi3qinBsusTM3sYkwAEFUXKpae/ONh3zCqByD
	Sigc/ZtOKmdIsr9CPj84TduPSi3LFIjTUIDD5SgAe7i8gjj90IAXT2UzQ5riHHgo
	ZUYpaTJk+IQEe5+OHinLsFlyzS3q+AHacYjfFMahzYF9O0lb+w7SNiaGIm9DrMTs
	NUHFhs1PU8aeivtjpi60tFokifv7DgPAHmVWn/Awy7ViKzza5++rffdy1TzFK7WS
	LL+j7O/8mrw+ljJDTF1MhoohgdOrwuoBbf9UwQIsMDKnvA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9714-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:57:16 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-822ce245c5aso66824767b3.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788249435; cv=none;
        d=google.com; s=arc-20260327;
        b=E10sixjOYrKYQBhZdV7KzlSyXwsWnHfu+f687BG8SsVuSH67dLdH/eqjjahUy42Alb
         u/UOA1H3hoiFE4kKt5nWYSTkjTyuUj/+WbSlYoCEbRTe2fZotaAEqnBP8K/U9tfguF8z
         kYBXev80mRUKRE8oJw3hcwnuVCX58lVCj+U88frsdO+3E+zjKjnbLtsuR9q22mgYSEMm
         k+TmqIc2bMh40PKoUeP3G3qAJ2ZUafHSQ7cG8IKvqTjq4h4ck1hO8Z49K5n8xCFsjnyW
         D5bAXcZ76vhpqFZ4Dk8VdqiLMQgj7aMrN6eoZ/0nVTrK8ooj2T886UPs/IqgRsKLbJuY
         3sRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        fh=qQNIRdnM/Cil29I78dzMD5IrcIPAoeCtt7DEyx+NbQI=;
        b=hmJoPNA+fTED3JD6cOoY01jauC2kVpsO+z0IJSmr/en99zdffvVZWVw/ohDOffgg5t
         xvLmDg7bByHm9EhddFdmFvLpUDFzle6zfEUs0jSWTCg0nNrKXvN9wj2wM35+3n8jrakb
         e2RaBJgWgaWAEhMc+ULlmjJDzXzB3Y3VXb6JbjWr5sY9DuowG31g8sISzgwEsJM9d3hX
         UpT2w6HBiGODBZa1AOFXFlY1yosD058RsRpL2aQG1jMV1QrtBvpV/DBGEVYyqkzZ8MDN
         Gn5vd2zz7iXUAJfXGEN5jpEgOkbu2Zbnmz9gPMhnXT7EKUenYqMmj61In/Yf4QI7t7qZ
         Fzqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249435; x=1788854235; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=L8T+pzgdqtqU2M1D8XBlWfxlCiNIrSRwoMjr1UagAJkVauoAC4M5E8iqshF06sTCg8
         zEFqGESBvOKQxYqrRJMyKkvoGMjbZXERb4IQhdJB8c1exscBVLkPLoynM/nWIPt2/6M8
         +jdSEZuujkMFDC/Wt/8OAR2Bd/hbCF2IZ0AQXZsNYQpey5n+dftQ1pUWA2ieNTqwjkQj
         TYqOjGUr7LOn89vUgskg+5/jVJ2QgxZlDUZb1XW8+7HESTfbc7TvBSAqJ+tJQKN4bfh8
         H4ZpgLzGYcZdzWecOOFfscliXzzaHoSHiNGxn2bsyQxm33iP7m7dCdqQftFUakxnOsez
         VlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249435; x=1788854235;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=bVSBMsXqRPKKbC5X18dA4EyGCRo5u2ZQIVhNbWO7Ft30EL318jzVvE29C3gLfhBOmP
         VbuGVfFnst596+uuj04vC3IwsUAd8SMkOJjt/AZFp8q9N79RaJWsq710tA3V/2VMm+vs
         BKEGcqGZX++2hDQCCClQT0xOVdp6GMPRGPtQguRUd4x3hwKbTpwmvNBR5LUnnrcrvLSd
         6TI/ZIYrqWDA/MPPwFbplJH4PpDgYdKk+yP750Xw+Lk0a2glfmHDq8qPF1/EOhsCDnSA
         vMwzdCIj1zGVlcQOb7ni5bb/Ewe1PQqGJN81RMUE24Id4B2kVdHIJUQQy69RfKZaYE7E
         Z20g==
X-Forwarded-Encrypted: i=1; AKwUvByZ6AWrdJKiODMXigH2cvoBZYUWM/7EtNqPme4riF3LN7+T/BfOzI7NO3EgpN9wVY1B0pgxEcDjWgRw@vger.kernel.org
X-Gm-Message-State: AFuF++lywL73IuuaVxsXYOrL6bMq/QYBSKPsx4ePEXwrZvj2x+g2ZGC1
	2pLsyFGYqf2h5rvyHO9UjvI5gtsDI2rHuv9DwIvaX0xXgVt6xjDhdw++rEQx1F0ZZsDIv2+iWBo
	zY/5dH4M9mTj5OUofE/EfRxn7e0SilmiuIzh1NDBl8u748X8y8cZPwZdLOkS+3gg8/8gvPLo/jT
	noN0D6MXXSD6sf48Wml/O+gEOo/+AgC2xHLSBxeII=
X-Gm-Gg: AYBFou1zVqXlzXf4cOMflFlS86yStYnLY8qTGNwwP6YbdZmFxlxo8pKWmX+VAFbPILq
	gt8yINBvJwIFQrQWLc4m5tmbtmx1+Mjt9QP7QSTM7VXDPoY2km2iG8aJJNwW+Mtha//ZiOWLI6B
	Ov2/9lVPBTJopuuh7vscoloPwRhHJ2F/KyQb/ER22Uvsz2ltNUjpow3pdnmg==
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id 956f58d0204a3-66e4c728865mr7583288d50.25.1788249434547;
        Tue, 01 Sep 2026 00:57:14 -0700 (PDT)
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id
 956f58d0204a3-66e4c728865mr7583284d50.25.1788249434062; Tue, 01 Sep 2026
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
 <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
In-Reply-To: <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:27:02 +0530
X-Gm-Features: AcwNN1XYMRVqJMDI8M2Ek-7j5XHLY831M1TAKp2IsZzjDOzQlIlkiRN0nFaiwDY
Message-ID: <CAC-tS8AHW=jobjaDnyw3BCo5SXZ3nSzuC1L8vV4aq-zkHuzDyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96855c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=nUbHkpXoBt4ruc41abQA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: PDjli30TYU-JVwP6AwXJdQf88LgQ2aiy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfXzmwpvVQsPZy/
 k8YO0tU4kIOzbX8955P7TngxrlLEf6o4Zo5Uq/Fxz4IwPESE6Ko1YNUFB1TUJluHF6g2hF6oQn6
 MGyatMZz3KaaktxHkh9NiAy/XFLNExU=
X-Proofpoint-GUID: PDjli30TYU-JVwP6AwXJdQf88LgQ2aiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX72hiCUlEHvJn
 IaxM6oU431aPQhq58f40EkBh0xw/yBug7cEisFQ5GBjQTlDVwowr3nAo2iYOJlOM68CjWHte+Fz
 dAzVNBe8gEx1wVf7jFIdkdnI1P0TvrvNdElRiBNQ4EMjdmy58vMS9KKzdXHk3W/ojJsJYY1LIf9
 thhk1WIANuhnpqx+YhBS+DDPmZEYFfbk2GHDaZZR6Jeyyw7qc7C1mz8fiTCA5RDq9U3Q8X0XCgT
 Me3/iRIWkOF9yZo0nTSAjxaXTGZvQWAkBKKLvlfBVsVz/Bp6UzdzXLnXyqvWE3DXMAtpbuXBNiX
 hQatAT0dAw8Kt39nSX5+FDGeG7GSZPJml9tboIM68b8rixsZ0bgg0H++h75xo+y9690uAkXyJrY
 UL7RJuWsI9fFuLdIfxaj1/7nFLm6IcTtQxoVK8IDfAemr0eJu98Au0rH8kj/e0PkNpHdmSeTFLH
 iIl5iRrmYA2E/W/Jm8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010070

>
> @Harendra
> As I understand it, the hardware interface mapping is almost similar between the DSP and CPU solutions,
> May be the no.of interface count be different. Would reusing the existing DAI IDs therefore be sufficient for CPU solution as well?
Existing DAI ID names are tied to LPASS hardware topology and do not
align with QAIF port indexes. New QAIF-specific IDs are needed for
clarity.
-Harendra
