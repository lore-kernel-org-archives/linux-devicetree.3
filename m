Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38E3793AC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355560; cv=none; b=FRdpgxNZ5bJ+f0lbVQLCYYl5vL8MDyfcwMdjdUya7sdvdWSn5vXtIDAvWWgjrfyS1xOtPna1hH5jyJKwJB50FLuPtv39O8rN/pm+XONl1halyrNQ+85xlhVJ1rV28arm3GCcUv6mbgH71gdFaOc8K7ZHSbloXSaqE7Huv1DGs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355560; c=relaxed/simple;
	bh=Nqr0JkyvOkWgV0sS6fsZzWc6BzCw19rKxhEgw4XggE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn66qADrn7ZxtoPcub0cROfRaErWVQIxSxkDLoYP1j59mtOhPO46pc1Uj9bwTPdgFdZ5ZaRXlpnuWuvcIpxQ0RMbt9rdMuSZcUqmGG0b8/6QPvkCBK5H4TaE7VGoILNA9ArzQ4y+LTOcspStNj/NJ11npoytLFrb4OfUNXcU+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4rGFuJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfwAsDHF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4rGFuJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfwAsDHF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kQB3527366
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=; b=O4rGFuJJa/RUy66+
	B37Scskag1m2+a99JU1Cfhs6rVEBL6k/iQwqN1Ph05mJWLyAnlLmfaRfLiKMX49a
	cNRf/tMyanfsxoxWSEAv7H9RCptbGxxtTukul6QFbPnEr8e/cH/jsDQ6KGEW1CY8
	S5Q+aV2Pn31w700TuUYbKfetyB3PDoH81x0hYmyDgwSB3fwLfQ0EcB3qSiNTg2rz
	fdzYediEtpypCSs6NchwZhrDNOjy0dFqn6YdMak75qIUf/TQbskoSQJ0Oth5bQAx
	LL75E/ocmQXtueIn1fjwgAX0WnNHTEcGIOMEgL8c76QRS/DEx6W5pDk2lD/EyfYY
	bgDdsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgtqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:25:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90fe39eab32so100087785a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779355558; x=1779960358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=;
        b=AfwAsDHF6/IdhYoKWTavG5y4jj71K/pMGJAXU/efiHySGoGDTB58uW5wPtXQRVHaP9
         PV8JeonG3mF8fnCnZo+VPoNH0vQcCatNAUixHLixfwOtLwLFnrFxnXjXf0aRobUqZrVk
         ZiBpjZp/+55WpXuwIPL4y3MObFAKISEPiTyiYzOx9RrGQAvaN4bPXmfJzav/fHO1yLNg
         ZL2UdWHmA/c2muA3TUPk916y9cSJ3gAJHhCHDpukoUrs3n2oV5HHRxohn+qQrF9vWEIA
         +wQSNKge5/4UaSOfasjm/9RS3nmaL4FIz0yowIqvPetCDNkOvxnG1c69WAoya75mqVT1
         jSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355558; x=1779960358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=;
        b=EyCXhS+/FB0lXZWC+3cHdCdvzM7xONxxDK0CqbYel7uMW3EYoj60yH77PcC8aAXgmx
         ZZRF+Sx57RHtlbtwD/cu8xbg8sJWemIhKRNoEJ/iE6eJaVArCGUulc1SFSeT9VqDanyW
         C2OxqRggGQINx92axctcsqUIiIynpgLUMbhdCuI4rhEt5X/2Y4mDRkB+H0qzgtBg6lvx
         JKs80cuvykBqQKiLDc+FAr2gTqFOMP7FLk3WtjUzVRwyiI/QWA6GKXJ4yG1x/Id0oOzN
         9Vj3jdlCdLdeWgWVzA9Mc0k9T27YBtpTBKsih4oqlb6ztOm/nVeZZ5bxbhxXCsf6mFWh
         Awjw==
X-Forwarded-Encrypted: i=1; AFNElJ99TjqjgpAJFY8ofjVPcx4fterj3Q9ikECFQUkdgp3M/kvyi4SNeTlj2/Lf3IlLvqLbylq6sa3z1Ib+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxofv9jJ2gx0CU30SaSS0+3ua8SM6rcKpmDBx04rCb+wDsWEil0
	9uh9R2f0ykEUTnlPJdut1+VEsl3Y1K1pGszCs9t6peHopwJusU+QI6/H8EtTBBF1Cc8YR7HUYpW
	ieBE/saWijUS8JQNwwzV7K2zlrvhXYxruglnRGppOdR6CzlmdjX7rc+3rW+eqltAR
X-Gm-Gg: Acq92OGlqSUgdHOE77ggvHpCFjMH2H20UIrLcV6caJfaybydqMs0rRDAMKZsLHbeig+
	1S1DDL9TEdQ92RJ1P2Q3EsxuKKiwqzXDDUDjHUl7N6djM9F/CtnmyKDGpA2+3jfCYS01zBjQMii
	qMCAqKNFMYHB2nWsTrn6l2B45QjtohRunJQH4EfZwy9eLQ1R5QCBIKnr1A89Ie9pO57uhrJoRN5
	4u8CfCymmjLhq3vVA3crNOYgH7PHN7aouhnUWUto/mrh1R027Dox/yviYMb30RGSwMJduQvLcSB
	G3R/8CfPpYjxfubXlEIoPVeUTaElDTaPhtTj/PwO0S5ksQEjGAttEiPmHPYudqMrZO/Vo9S8TPf
	eMAp62GPZDzrCpEr5ZvmyuZw80QMUqtVeWd60l2cf+R6LDmKRvcB8iSoDfERJKQMoCq5lQpqTj/
	9qSdc=
X-Received: by 2002:a05:620a:bce:b0:912:38a1:1273 with SMTP id af79cd13be357-914a29e3d84mr176221285a.1.1779355557702;
        Thu, 21 May 2026 02:25:57 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:912:38a1:1273 with SMTP id af79cd13be357-914a29e3d84mr176218585a.1.1779355557257;
        Thu, 21 May 2026 02:25:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e6d1sm8694015a12.5.2026.05.21.02.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:25:56 -0700 (PDT)
Message-ID: <1c570243-45b2-4813-b070-9b22dfa787eb@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:25:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xilin Wu <sophon@radxa.com>
References: <20250110092326.167575-1-mitltlatltl@gmail.com>
 <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
 <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
 <ec4d11b5-7a82-4e7f-bab6-290d1055f1d8@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ec4d11b5-7a82-4e7f-bab6-290d1055f1d8@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5MiBTYWx0ZWRfXxDBQ/lsS1fFO
 cGsGDrWxIxp9lulcwW1LTShSb7/svb2PXSOGPJ3iFbv0mcvKid+qbKE8kZBOaJk7HIXjSpe67UI
 XOFL7ZU3Z44zZ7WfSl7+ed5UqJdVgnIoQWn6G0aVpFfjBEh3XdRpUMRmcjDOII/Vgg0WJlrrIwD
 zvh7XDuP9NdzT/Vz+CsAnjePUGFcmktj3F8fNKoti631TTdKkqk0tJedQpW/d3Bm0GkoiLjSScc
 ERzSBoD9d5TUvpKJ957TXzulSqK+w6yVI7DGTx42wPgiTg/nGN5C2sgT6jaYgLyuolrGJVk7ACf
 3peT/EcyPg1wz7FjEJkfi2irpRaaWGRvm0GPOn0f2Z5ul6pbhAavnkF0R4mcMcH1pXf+zuxhKZ1
 QtlNwa9IEKw7tsfJefi2ZwxapLGlTjQkyBmCdXlf+1utflTbU2vawlmJ6gTyvpZjUvLS73EYEH5
 gUGxsCMApMWn5pjRBiw==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ecfa6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6WkqVPdYesW7Ksm6RcgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: e91Nk2onjWJ6xFs0xIJLvDUE4zKnqrU4
X-Proofpoint-ORIG-GUID: e91Nk2onjWJ6xFs0xIJLvDUE4zKnqrU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210092

On 5/20/26 9:45 AM, Jens Glathe wrote:
> On 18.05.26 14:08, Pengyu Luo wrote:
>> I think they might take the power sequence into account when they were
>> introducing the devices, vdda-phy(~0.9v) first and vdda-pll(1.2v)
>> later in the upstream while vdd(0.912v) first and core(1.2v) later in
>> the downstream. BTW, the DSDT is unreliable. On my platform, it
>> describes that several components are consuming several LDOs, but
>> these components work well with these LDOs manually disabled via rpmh.
>>
>> Best wishes,
>> Pengyu
>>
> Hmm looks like schematics would trump these speculations. Maybe wait until this can be confirmed.

My previous reply was wrong.

via CRD8280X schematics:

                USB0    USB1    USB2    USB3    USB4    USB5
HSPHY   0p9     L9D     L4B     L1B     L8D     [L10D   L10D]
HSPHY   1p8     L1C     L1C     [L1C    L1C]    [L8C    L8C]
HSPHY   3p1     L7D     L13C    [L7D    L7D]    [L2D    L2D]

SSPHY   0p9     L9D     L4B     L1B     L8D     N/A     N/A
SSPHY   1p2     L4D     L3B     L4D     L4D     N/A     N/A

USB0 - usb@a600000
USB1 - usb@a800000
USB2/3 - usb@a400000 ports 0/1
USB4/5 - usb@a400000 ports 2/3

Regulators in square brackets share a single input pin on the SoC

Konrad
