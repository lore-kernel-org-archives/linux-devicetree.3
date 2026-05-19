Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E73A543D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190040; cv=none; b=fAPrzw4D0tZUxo7WbhLiS3Hddt5z8A4ogicJPSCsFyMwb204hKqUEt+Ouw9Vo1BPwi1ub8+j/o6TIyDmNeM1ozGRLybgMtTpzOy0VxwXs3FNr57XpXriwg/FT+5zWemleEpDomuGw+33N5vDWmEzfLhi1RZuJzAmB7tzx5X6vNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190040; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7Bx8KHtXplrT1Ed/k1cj2GMly8Wa7lewZ7fXRnvVQ9eXgyPkGXXBQ1YlAQ3Tibl6dfrr/z0AGjVz2PdtIjK5P3kMfTJH+e8MBsrgOXc3JPEAc9V+YP1eOXcDhWWOSpW6tljZKAkk9WuvDLo2U1KPFoO2Bzjf9iT9lveND2EWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9S18bOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iapyL229; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9S18bOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iapyL229"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAbdW6867049
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=Z9S18bOnED9QPIPe
	vPgMj6MAlYOE59JLioS+2zAREr/uN2PthQNTCgTpVbJt25bNtZBuWIIAM9p72Jh1
	HS/iBlj/PvBshLMbglw4vx4Q7P+bTEEP70kVRMbIh9Be2DXkv4Q8av1z+z/aeHRH
	6T7gvUJQWTvVrB/yO+K61PjCuJ3kd4JnQO3nafNxUvbmTcW60NZ/V3eNer6AYlVc
	ZeskDFvqFQl4+q6wLVS2jED04sDPdN9TF0MiNYoyRoAcFdTxyRuE1z4zXe1CEgTt
	57egWu86yyafw1ZSRZhBeOBKNXgH6w7DKEDdv4D5t6RS6rAgz8m5sL14oRdnxYf+
	1KjHtg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hfg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fad7b0ae2so12664281cf.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190037; x=1779794837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=iapyL2296geMcN7dNN5sebk9hsiVBpHXMJoqoJ5E82nJOnXh9K2IWHRTQr20UgwblZ
         eACLpSJ1Ew42QS76hWYH55QZ6NN4hV8xzUWCaLX0KeVmVC5wXBZeTySnFICN8QkzDE4N
         PjZf61rMZ0/2nH76bdy26Qay335b7PbrptqsSAz67Hvpp0CxXCyKH7D9H8ZBI1IwrZ1s
         vk9XNYN8Flx7WVVxfiCvn+f7aH1HU01X9bCCZbHymBOdd1ibCD0z2/xMizri1lFcNN4K
         +BwbOcEshmOQ5UJFDjzNxVkNFbJualVs8LaSYyUvYLVLrJ1S1B3iANLu7VCu9y5atSNL
         8ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190037; x=1779794837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=sc/lQ/bpDDbL48NtTsUby4PXqIVa40uwV7fUBGWY1qH1GKDYfLoQDcuh4bVjo9ZMCp
         djRsjAcWHLFu/qSVGH59cwWEqGusTUguYGskEina1x4o6Cb75gjz4fGg1fcdG6ltmHFe
         kwv/5oqtYvuSYWw7TnTE+XZqJGyIKATNQLj2MO4/JIt3Ri51n2UieAfgnVP72PnTwv6o
         p89U55il6mC+CFcWJe9YvTgFVESzBOGECVVZ9DKbytF9xnHC8KUSjT7osst5h+VrCk1e
         GwoKLijyGDt4HJKNSQMmVW2oNjQHVOlEHeeWAUpTV1CQzV6ctRrkHpIFw/2ofp3xdn8v
         dgKA==
X-Forwarded-Encrypted: i=1; AFNElJ+ogAQbeutel4dJoiUq43i1CUXOuRZYH2OtqFh2YLvud0Ftmlpdcll5SvfN0gcweTz5UGM7WgJnxMFr@vger.kernel.org
X-Gm-Message-State: AOJu0YzhbhOE3z8ymOUKS/SWKbIpiwr736UOpZj3sqSAcjHsz/gEtNwg
	hQEckhpAkaCOrYEafbjZfjeOtDUPKAX2gAP/mlE5pKw5LBZXeMdrURO49H5jiGLuh2dgwx8gVl2
	3t16ldxgfXY+audXXO87hHVFqIyynU7tZIle5x2nw+csgrRSiSO1WmrxSHWg2uA4i
X-Gm-Gg: Acq92OFDLmwRyKr6qS9UZIgwuFxDz8lJHcy2cYnomgpt9Y5R4YCBWOb4YFnKVSDSyqm
	tdDlqP5pvMfFtBvJVLn8N3W+7U9x3HwURqHaA/XYlNsqFbk+Qr7OMCP46oQCI95EhD1HeAIq+8V
	ojIf8obe53Q6v6ff9tKd263jYKTKqNrTPzbdfiQvkBrBxcFNioiR66c91EO4bFlif1WJ1etzDTc
	GOPWmcS5tjzYJzRPlojN4ActnHc/jmTimbqwM+UTGLaLK0LpdQFo8UxObsuKnsuW3NZCfNAEPrr
	HMBqIQw8z69Vf336c2j6ToHr3K0IpsfCjgmF8zMEBEHTwNWYCed/1ClS6iVLnn7VtvlTFkRSCPO
	3PEWLB+GU2zPgz2sdnagYe4+G3OmvH1UJXdqUx6dqAlqtV+rbQB+wYQR1qYehGE/QqNHf//9yCy
	Nb3V0=
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr207110641cf.5.1779190036740;
        Tue, 19 May 2026 04:27:16 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr207110221cf.5.1779190036237;
        Tue, 19 May 2026 04:27:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c28c0asm707868266b.17.2026.05.19.04.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:15 -0700 (PDT)
Message-ID: <1e37d962-04ff-4dbe-bce1-1dc1ef655529@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: pm7250b: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX3db1JfIePTov
 MBmLFyjCxnCzMG44BmQUy7XzyauPdNMxMvrWomE0buW3CIlOimIkEc3+Wz/tzYwJJ4zLjDTsM0p
 012wGIuUgpsIPKzayT0Wrg26M06u3OVW6OAYm1Ee2uY6I1kNDCISVBcSSxWFgBS+YvZBn9vWzCi
 EQqEaFbXFDgmYicVnxWSu1M6Swnw56KBxyOnXGMjXlMY9Cqknr9CLGOIPTAJ1nGy5RwvBRbAoop
 dhWyfwNsBHPse0KwPjBFJgwCzZ658PqWqDmwbE4eKyFyKBRmtJBZLQHx0P67yA87jUGjl0ity6k
 rvNrmzp6NYn3dBH2AazWlouknY+EMeXJeDUYG9lPyU257G62AYN82Rkcm83P45/ECps6/YRywkt
 xL7QGqRGL/x5MBOVGX8l12HFLGI1oe5Sm52YZt6unQe4aww94Bc1HBjYmBOmjRTDpllpmzYK1f3
 FOwqHoDPMjS4fOWMpJg==
X-Proofpoint-GUID: pgt-Odh7BUIpOjanKs7oOLTCUqyxDy0y
X-Proofpoint-ORIG-GUID: pgt-Odh7BUIpOjanKs7oOLTCUqyxDy0y
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c4915 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190113

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
