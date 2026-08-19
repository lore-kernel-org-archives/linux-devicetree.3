Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED3A2D8796
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152165; cv=none; b=qkZnFbt3swdVrXjaK4Gdv96fLU34UnakxQjdF/lEgYQr/1UKa4gPp5LPQuHvtSxb7eczxuuSrYh+oUscNg1/6KVh/3cjj8fbKTTLKeTIUr11BCbT+Xmdw6JQBProOQfFeQTxyXWuQZijHfQO1t16fQwxhH6ucsXUaEHXuF9ZOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152165; c=relaxed/simple;
	bh=wSE8pRRskqRuantWRq10cRfN3D/Rpt8MDjN7XBFv93g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlZzHbbG3oYhLQxGA8uu02NxyBQlMMI5URvQv41Nc/MtNB9S4DUvwZPo3spsXakX9WKMn2nQHLGh1qj+DO2uFQNoEcfv9Mv+7c4Kfk2iBiTLtpeXRGR+uIFtQOoPmWXLzLjlpLJKmrvPeniyjSEML9vpdsRgvNPsMPswD73iXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDjqaH/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROkDpH6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDjqaH/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROkDpH6M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1mpF444709
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=; b=aDjqaH/Zi7IyEYUn
	eXHJf5yG0fLQD+Vw0ezLbOhSJOuAbHnGa+J7DgmpQU0JQFx2gaE7o1ItDyfATt/q
	Z2v3SLcyLIwiQn3XZN2rPY+rQm7TGSmuBa2uyWTmbIDmxKmXyXn0QKzDiAnMQMLZ
	gJwWadZhshkHOReaugMW6AViCJuqo1Eu6DWKiXjhLrG0hZy42MlHwev/HVipCtT3
	wt46NC64SDM89ga5vY7CKSrIUrZRFQdIQxAIOH7hy5+MsoI/YQ4FcdHHMxXBx8C6
	+ylDzL20aTEgIOMb2xSP6uxku6QRvPHxqZdhObarQevIFMHhmxM3mP3Wu4fckkpp
	vm181w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es60154-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso19767285a.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152161; x=1787756961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=;
        b=ROkDpH6Mmj5AkaksgtraAkyP1g41I+Wxa2nmyFyAn4p7ICuiqSxQtDChal4h9v7Co/
         9rKSOPIuoxHdN1srM0zbtonc+ExtL9nmGOzb/LW9fLQAKU5sYpCR6LgULBsc9V4YB432
         xp73H0rJPfVeGaqYEv+w3Rxqm7IEb9ujGU1N+GGwRGIwKTm5BgTD37yfbXIDiFJKfFRe
         xBsArXqQUJJgHZ7ps+qP58KPZi0eRXUdFpy0GBY1clonAW0VlDxc9gDGVttxAhfimo9U
         ksgD1nWHD/7ocNeJ+XNDlDHwpc/+E09wny7SPtfW7Q0+r9bqq4BhKG3Vv0pslpXUdKm1
         0jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152161; x=1787756961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=;
        b=jNxDNNranIS2IqfMRr8CTttX+lOea/BxfGGc2iJtShwNdRtuwiz5Qec9RquZzOW+SY
         9TItUVsjsK3dgX+PJ3dQ6XtTtfc6A5aMxAfutpvuUKhBy8AJVdUe1KhmxVh93hf+hGWP
         8wIb49Mez+HQf+LIxhA+u7wC4taUY52Q9X1jtHnV1unah74nlyCPX7ExfaqpSsio0k8f
         ifNFYwLjNSgFMtp1I1n6jV032bjukFs3JqxDsQOa6de+RsTBEUMICUe9G8QEeqLaTKM6
         yC1JQad2KpcQriOB6Fdevz/PQMCMk2TDltmKEcfegomJISYCv9VKfVssIA9iZ1SqsvB+
         ksGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7YwSGM71jktSA77LnPG1342RylOzvMlNM5B5lnnlwsL8b3OruykgkwmGoB7gAq2TH90NYaA4gT5Ec@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrbPoiC0s9b631USUeYyIyw6XIkk3xq5DRjbNra+qCeSXDCm+
	uPScZN9rAC80xyvFRZBl/jmNziA3wcPcGMvIk9n6YKIIRynbeZTBfeXQJKlnq0y4XYHNmCh3Alx
	k+e2F0T1LWwWQoit8lVOj98jGgX6oC6BVsIexKM2uNUe0k/lvajuratBFfLhJ+VvG
X-Gm-Gg: AR+sD10eTKBATnZqnmTSCnOKGZrLer6uxxJEITivnP90HScayUtnjaT8Iai9as+bM9s
	2dlokZM77x4Pj6ptybTQ9uklmZniYlVk9WtfJnQKMC+dtZcPPdDMbQjvTtlMTI6RoTwsXTXecP+
	OlJ4c9d7KhqIM03AVWS/25HfwqamxXT8FWIIIJtXY6ZXu/6CbXJOt0xq5H1eITPfZUVIrT66qQN
	rrk24biFSYuPBhL8WchuXsfp3hjXcJrvvzS4mKwVTEGMTGd+9Vlz73XVjLxh4ztAjt7uITw18N2
	HU0xq1KAvYOINU7z1tpoCYixII2H7RoiI/ViVSIqDpDQofLcsmq8DllAXuKdLdJ58AMzZj3LGRz
	+4DMwC1KIOW+1XvLphZt4Ou3T
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr338406685a.4.1787152160989;
        Wed, 19 Aug 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr338401185a.4.1787152160527;
        Wed, 19 Aug 2026 08:09:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c244b6a5277sm21594466b.36.2026.08.19.08.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:09:19 -0700 (PDT)
Message-ID: <c71a82ce-b571-449c-bcd7-24f1315e96d4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:09:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-3-e3db456e10e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-3-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a85c721 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rh0vvufLDRpe-OdFHQUxpbI70ovfvnUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX7jnSHQjIrCWa
 JgUhzLuBsUHEDvlWe0Bmqb/xYPNvou55+eL/h8eLfNnSktHWLKtyQ3FzeuUAhSfNO3GocthrabA
 j/MHgsnVY8M/KhYKmYmu7n2X8vtCFmsLVpZdD6OFc42fpV2pkc2dCgx0AmeGx0vSfMvpDf29dE7
 hHKaYKLOHdHJH6lMkRRTNHx+aFQ54Cf6G1JFbyPveTiNFCwCMXxIqROUQlqJwE15ITAGsM4zLql
 8XTc51KXHM7kl7Jw9a5NAUaT8DAAtoRPUcTLdvKl4wLEKxpP/OfuIkhaC9NOWaUaqkCIy/C8KY9
 ack0V0EPIurkR0Gby2OY5ymm8hEWZBsG3fD26HyPuBXx0StyYnLzdzI2qsFPCXDfCerbuqsgUQD
 eF9IyzY/dFwE+olkgcZdmsPAesmLAypeV2l/Lz58ePhmhew031E2b1tuNaqLwtfAfy60bbxFb68
 QZeGl0dY6Agz81gxmtg==
X-Proofpoint-ORIG-GUID: rh0vvufLDRpe-OdFHQUxpbI70ovfvnUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX4wRqs6BqPfgA
 LXMtM0km41Yk7qGnCzo/8qevXbHgCRQEDOOb4isOjhjy7svF9N9KSXTVf6JbqMgPImgrIsVEvZs
 U+CBQdWTJgg6Zobq4gP5AjZGPNXYkdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118

On 7/28/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
