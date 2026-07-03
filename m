Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2E356754
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063793; cv=none; b=g7QIbLDcOYlOAkDVRNQ2F24SP8pzlN/uvjehiPAYhkhXmDdYpHF6ZlWo87MbdK3z9B1sayp3/1DDrow4tw/SxUafjo3M1YVodyHnJG6jRO/s/Ai76Uf+gJ/QvVyKqaFVAmP8w+jxjAZs+Lg1vezFdcOiOd32GGmIvLR0QxIe5+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063793; c=relaxed/simple;
	bh=keYYojx7hrV9GwpDS+RpEon2iNQ30Tb27/cqifn/KEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9wHzICpd9mKE0vafc/zjPtcBoLyPtgQOU3YjkcfmWZvN2FdPilmIdnCeSjKyObDyPVCEgpPlukhcVjiFORgMKiz658P8eqm68QHnaM5FjzUdSyuMfQ8pjc6BP5e3O7I4Y3yJAgRvx7M+diz8rUEBDWUPBGNEpJVv7MgXLOUJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cl4WYlNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/cYyKy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cl4WYlNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/cYyKy6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZ3k3136093
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=; b=Cl4WYlNmoJILtuiN
	1v5f83QgXNLOdvN/xh/RR81yVzmIaW6/GLnjEki1H2MtKxbq57QIZiOx4XizLwbz
	VAKHbYDu6fIYSyzfpNwVwSqMunhuOzPUS3jbHh06ouWlbd7yYSm53AdonjX2Kqy8
	3DFj88j6DcTVR10bHzibqddPjJHyw7JEAfJMLaqqVgWeyzepcK8klSn4riyMIYfX
	rBdEMlpquOSwJkic6S/pPKnUSAudpQiM7/+sNE2SC+t01YmFVItduecntI3Lnjd3
	uDxAJeIE0BPeUCns93Vr3NlJm/5xtBueveo61RALMglPHajDO6t9B39cEK5glXlo
	oNVlgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b596qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:29:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7579ded2so4006685a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063791; x=1783668591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=;
        b=C/cYyKy6qyEpUZLpGaUpSBHiLEdp8duPIyns6lTCAjV8P8EoGjN7GLf0Qbo8qMfBdx
         MfMwxUqMiACd6vp0s3asoh4aR99tgGWXM9Rbcm1PuUT0sVuDOsd25BE0qV5tl37thm7N
         R8TS7x+8cLmP/M+aYp5s6+FOoaTcv/76q696agQrXJbzdiHbezo2WaBl1rdgQVGL61aU
         gFORKXzgJnhP/6sJiZSHZD/lDkFZdDtuGwatuxzo2qlOQd83KFqNTkuoLHrJESFk0Czm
         SoPapkRwPOAFP71FB8V0n+4gLEps16dzuF/zZWXN8qOcz4Lt/SU/Itz1U9w6lBdHfDwU
         J9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063791; x=1783668591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=;
        b=aGKLdi/kJWvjVjc/1O0pfXmpUBOwK+KAyUec+aortXdFT1KAyiPc9DsQM9O8Z49rz1
         iIU6CXRpE27g7Qj7am7Z8Tf8DNVxwaqPqHhp9iWfL2KaPgJb/usmYV6pw1U4iwGG9h/v
         wL1Nlj+Ro6OyoNdGk7/MYLjAjVRlr0Qn8D+SkTJmsSxn3olT7qlDWW7V99hcNHz7VqPa
         k/taTsndi7zxxt9CfxV+HQeWitpMRBr1q/BLOMTCoTZVrqmOA2HlII1jAxhMcJ/zBW+W
         cWB1/ua/zsXND8JVZfDvc5ASBHcTHnuefBAsZhlJMcUq6R7HEES5DJRuFgts7JHV9KKL
         q0MA==
X-Forwarded-Encrypted: i=1; AFNElJ8hiKdsU9RwkKeHJbY4S6Z/ZJVn6mAA0RS9XGGsZneVjHNnySN89Oup15djeZf/aEEyEovSXFfNxBNh@vger.kernel.org
X-Gm-Message-State: AOJu0YzThdr8o1pTNDyEwbAdcJVZpF5YOuN7/K0s5Q0M0ZnQUzms6s5e
	e2OkOEyuurZGa53qKjr5fSiXSPK61lGYA5CvOeuIppBebBwjEvJH3gtsIqAQ6mDxatIcPCCzkk6
	s2vmSteA8C21i0E5XRA7xoB3DtiDu2LbBBcQCLOVBfqsUiT9c/CikFPk8TO66x2+7
X-Gm-Gg: AfdE7cl+F77MB1pdm5M82TKX4FL+pSr7Awp/YidgU+gJ3chfL7BxxubaAgcdjWPf21p
	pV2RjOtU9/G3cCaEOAFEJfJQd6wCmFUCCnGUTZRn6rei7glDdw9Nl2fbUthbClSmJKiD1D+ThQH
	7TtIK2zl1JFSXSfN4aMGGyhSmv45LL9oDPcoFFVD3cFEiMbWPmyD6GVHhFvIGUTj4ynuqe5BVof
	V7AQ7cKuaV/buC3fqdVsnM8Z1u9O/swHqNAs1s+nm0LqARbxZFF3MR99lSfohtC4POGG+uV5o/D
	rdSWKN9fu5wN0J/zT8VucJat3HIaPpBG9EgWb72YO9CzfXXhYyPliP7qcHBQ5nMcX/kI+tp5ym7
	I/MtFBdMDJmHnRm3KIMFUEFsSj9nCjO5eFIA=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76392551cf.8.1783063790820;
        Fri, 03 Jul 2026 00:29:50 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76392391cf.8.1783063790422;
        Fri, 03 Jul 2026 00:29:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm236629766b.62.2026.07.03.00.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:29:49 -0700 (PDT)
Message-ID: <7070bad8-3210-4bc8-aefe-8cb0c2d51a75@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:29:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXzDosWvLk6riD
 92uRqO1A5MP9K7RCP7pe612mcYcGboJDiRuOyKQUAwlT3Pb0x309n5Six6g+rYhV6WZmSOxM8I7
 eSwE8FZGggnh0m60JTtMibhlNRk2pdI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4764ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=slVkNxoZvn7uzNb-wxkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hZieavZ0r7yuaisGvhuDsp3BdyhZmMPY
X-Proofpoint-GUID: hZieavZ0r7yuaisGvhuDsp3BdyhZmMPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXzqY1iAI+qojX
 t/7FMT41ZkkUBAE4fguXbEmFe8Co3qo3q4HGlEjKAw9fTkTNqJSXV5lw0tBLwAJAPVpAgu4crR9
 QmsRun9ETMxlH1U8oh4HPnD/JNQ/Uda96QEUEGdCtIKsNuM1gtjhtmQ9W9yBdXHj5O2/MNGbO+m
 OpHWakI62jPosnRwGql1WTFb10TTHj9YHiOqcSiaNncnQlhEX4Wsc1oZJQSgxPLrvO2kpzsYBT2
 y6nfat81mozWlKLq7HXlVSF0q9WVCJCVW66NHNMNyMsFPGsdYkdAQc2F6uCouWMxGC16siEdJwe
 i9sHEB8hoEjtCXaG/5ZOfJ4pB7sHLukeo25e5W0JfJZyHmeJvHZ/Sy6InOKYD/FeLgyTljPnqMO
 nCB7mKX349/UlLE3Nsb36qbhYi2mccb/FaRgFfOCYp3P31NtWRFMwaispoBLCOTFiScvjhb19LL
 qrDxJGZNcLie2ye1XJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030069

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
> clocks are kept always enabled by the GCC driver during probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
