Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C943F12C6
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287283; cv=none; b=sRtkUZyY01sq8IYZmiaNd7jzdVM9v0dy3fgjVgOPdDwJwmbdm3vqspT5iO2FkkLu599rnNw1SANFJkCj00aDRKLutEXaNe/rF5GgIZi+kUDg4ff1XOaR74m2tzcvLYXp+03Uyr1wsxEr2Vi13rUw+ybJaTFraec+YSUNde92Jsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287283; c=relaxed/simple;
	bh=iqpOIrvf1/AYDcZd+jy1J9GwVJaYJ+8HlZKlo7iiIfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Az8ecS3hZqIfQ+uLUDO8IDfGBCP+ycDGkH8byqTLxQcXXkpQ00oP6KPBtf7kSuPzD9iCjomRbDpo0XgX7p4qbIWTJsKWX2EOlWuA2swfhuF+rwsqxQ8ZnjuAkf2MSQHvbV6LHwC4J8sbgQGVfn0eoCK/nZArEFLD9sDJdbylp1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWXkK6hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6nCS7Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWXkK6hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6nCS7Ic"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASaCO1191092
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=; b=bWXkK6hLCJC5o4mj
	zVsOOOFADXkVa7QEql72ZntBww1L68pJz2Vm3ziufB49Z9/5OZylYYZIK807u3DL
	KVSATuOI+eMHD/gmli6xm5RWN3PbgtGPxxhMLwT4PoiBFNgjh4OR8mLBx1lw085m
	050ctqSUyQ9bR4qxmbiJ4OpBXkHUoe823el+47t7AIItZZ+VeNJC759ZOkUmIv6v
	Hy3cmzDJuTr5PJ2/CmAMHq1wckhj8FSmQEdXxEout2cnRTgM6sy97kkLzvR3ZXBt
	42BKW/3gYw28NyA1hljnqtBK2zwUJkTBbl1UjIn4sX8ihPIJQ+SBNasKdpCYdJpm
	VASFIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r8yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:21:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso165520885a.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287275; x=1784892075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=;
        b=C6nCS7IcBh95L/p21dnY6mlAgSfOhCINwAyrILhPv7gXid30UIBaQHgVD1A8YC5PhM
         abMN0+dcA5sBItzmGXmQKC4qGWPaRcTbnnSQQSjh6DgYwu89U0G9kxwPh/+KMXqqhViE
         OU0nUMZYmIscy+R0c+V9f/mGcv6c/rvkO1gbUi+wCHBM4kshozLilHqO6AoBwfIR9I47
         FRtrhwIoUHaTVgE1x/fzMABp1et33RQda2xMjblyvmWGp/8A85sZs/fj9cMdP08OYqcP
         IAAj2F520NolWtyhDYNlWwiNxvlaoXmrQsp/ZtPVHWS5DehSMNPt9PxpG3T+baNbqpes
         sEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287275; x=1784892075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=;
        b=Xx9PFre4TH6aXKU5eWOnPhB7K213aCdL2Ie8XIXLgezLiQcPbA2GuRqXkp6X3Or/ox
         AtBaho+inPqFIkF6jpt39hwREvLXQywdwrUM5/gy0BFHe4Nl8rV9/BPXc76KRf56+O1g
         dwhmeObSSlLoboC2htqsloSLdPuIt5Q2xSssWj/JXzf7lO/ZKap+CPmZV2CtwxparZVy
         TUf8dSB7hqklLGndzIpkY9Eh9pwe6ejVxjHPfjNnpUROgokHzC92xSIR614OimqF6fYa
         LWOauRThFdZn26mnh1bp+v6ig7TUKEUwTtiklQIOnNIaOxRgvFLv6It6WBQTr+iIDf2l
         UeRg==
X-Forwarded-Encrypted: i=1; AHgh+RqDoQdRcVJ0MMEDpAY8+OiUNfqnHYwsLA98giiRb/0QVL3C4GUgjCLhhjulPYGLkHJ9ZC+Rx5tPMJFU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTqOwjPiWreZtFxq1UkRnVBEDsTr7dwkOOcGCPgdw7SH6IebU
	3rcsSwiXX0PpQAdygbTZ0dsCkUj2JJ6Z3WCd2zjgcX6agwwtTdciJO00Az2ZHMkzqI4+3vyQMyL
	vfJt6C9KVuGKWbTCrlpz1dgIYV/QIeT8BULEBsmb4xr+JKDG5W9GzITttpcJiKe0X
X-Gm-Gg: AfdE7cnHncjhkwUGk8x2XBpYYaAHN2eOe2pPFjTSg/ZR2oP2q132l6NK5C+03gamVlK
	WbEDD97TFngESm5B251UV7HR2o16vsGtqsPQIzlMKBOZlDTfItFibJz+ULMIKEDYc2UtOOPQOYb
	3hLCj3UNLEN+SqxkC/rEwpgB2aqpYXGrdES5Tp41r0qPGi6tu+WMyoBVe+bSCHTv/cTvlHVAYPM
	gGX37rF5mESkiLt9aNu43sPo3K/2YTR3M3uBY2IzY9RxAkZVFndJtpO3KtBerY48a0aizVKgP7D
	yAo3kKwhgOn5xUGIXt+X9Li/1FKuypiee0dvQsskNz/slCl3Bs3kEINdbeD8xjN1Wj/oHuL6ykE
	4dX282RVP9FiDehJMwYG6Eulo
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr192961085a.2.1784287275318;
        Fri, 17 Jul 2026 04:21:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr192958285a.2.1784287274849;
        Fri, 17 Jul 2026 04:21:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fefdd4dsm512093a12.11.2026.07.17.04.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:21:14 -0700 (PDT)
Message-ID: <a9e75dcc-6895-41a9-ba0c-1d3e86a421d2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:21:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNCBTYWx0ZWRfXzEELmkRRbRQQ
 z77QYQgT3YqupBAFYClwJv2CN/G/i5JgAHHXJmVsToTB+nfPy6GmvGAaUJAlpHytBoykMnFTW5e
 W9/vbFFRSk+CKPgVGUKIiRb8xC5V/ghY+tyunGICgLIjpiUBn4Z23CWhosPIcxt28NBDQIgNFEO
 OdgRjbdakSCxWtz7gUqXNvKpfvV+E23NxOcs2Cea5ciRCC9b4SrDtczUeexOyl/U3Jocf3YIh+O
 wY6m6EDVSbSplRGpMp6giaNvyoa9mrgMl5mDzoquP0hIyBbxad8x9WHFmWWam8PvxAEpaXXX8H6
 xsodM7CVbS7nFi67LUkU4KT9YQzKkN4NzRjM9QsIdFqchvdYcWPeGDbh1qnfLUHuz2ZQGk5zr0i
 PpIWbyKKoDGfm/8HLduVDAODWJq86aCe6wqTQj/tA4BReRhS4oR0u2x9quPhE+GEP9962LFw2wT
 QyC5jxdRS+Jcm7I1OUw==
X-Proofpoint-ORIG-GUID: aS761S3EAbbjw6jQ2c3fxtW1rVpv9fJk
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a102c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f-AdFH0jOpSPBr_pIgEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aS761S3EAbbjw6jQ2c3fxtW1rVpv9fJk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNCBTYWx0ZWRfXzUjCuS/2LY3s
 h2gFG6qYUnuafolbsq7Wxov0u56BiDyLx27SQKGuJnzrQBBu2V4y9U1k2FDQZao6cWDDaAOL6LS
 XuDg6Dq/CcfI7VRyEh2INBh9vwOE5sA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170114

On 7/8/26 2:44 AM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

