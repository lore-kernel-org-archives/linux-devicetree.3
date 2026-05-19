Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48E4A13BF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190024; cv=none; b=OUHEiD5h7UErzppPSjQAROuCJN3QDBTv/4UdT18hpkkXf92aMqWUtfIEHYb7mT7EKZUxaR4d59TP0l2r8SLFNKuy++57rQwv+tJELpDW9nNzO47hnWl1hfL0eI0qB2i2+BAHNykAFint+vhUJ+Yt16anvN0SM0qexH53f/auANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190024; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeKELupJtS84odO0SC1KbaGJgLwxoZECSBiOKuJ4J6ZZWLjMHub1mzwZPGl9WlDU60ONTk3sxtL8ncKRGO6Mao31KDKARA+PVLiTLexZyJHpA1YlABBrGlt/ytjf2XuyzVCMfB1baU5QyVCApM/OQ4Y53xc8P4vksdWzNAw0aPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1vnyH5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGJSueq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1vnyH5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGJSueq7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JB97eE867050
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=B1vnyH5lZUaKTktI
	OsK7jciedikezrLVK6M0pjKp/Vv89oWe/gvR4AFlGEVwhOXrJMtCTOZuuoAne8U7
	unQFnCu7i6W7n91d/H6oUIrs98MY2xQIMfEZY8D/jvDCnlNvjCF34NiFNhC+sYi3
	wkjs9nahzUDnS+RejxcVK6lOQGrcFbxmsBXlcBc52s5Wb9yDr7WNXCDwE/TpMv9x
	5lpUWTAzwZD4x78WMqPjhjHSXjvfnEj/jqjpQ2CMdKGwRZCr21q2wSnjRvlqyWEa
	cCZ4OsfDA2vD8dxZ2vqvx3udic2ZOR+Xf7TNWkMaeW0njzV/Qe74ykYNR5LqTfMz
	/Lm22A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hffb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90cd2fee41cso44444585a.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190021; x=1779794821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=eGJSueq7GApwj1RAPjPMkeoOtgYM7L9IIfkLFaZ/L8baOUZjaPE4gf9BT0XM5AAl39
         CON4fEn5ZYKdNaZneh4fZ3RIXRTNKQxBkqPBh2eaZhhjb0iKqjVPYPpdyi6vggESv8t8
         FFQABBIb063D8mlRhmJgK6x5DKSXbWOlFq/9JjfWWnN/lw4NqUeRc7imSpeh5889HsLs
         JxKM40K1l+6z2bfZ3oK+jU+VfKsG4jTATyCJcK/8eHVjpqEEJzcoRhgxlonqsdNeDiw1
         XvpUDhP+3/LG7PqjDD/eDv0X27z2foOxj8t59XQ8UiZWYJ+9R7MZDcbxF+QipQnc8zQ5
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190021; x=1779794821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=TMmn8tA4rSsuYYJo+NQxqgeQ5SqmjWJHtWS3b5/xEQoxci9fT7B1YGX2JPuYSDMqKb
         F+EgHvbpG52YtQVthbV3AO2sqglk9KClW+jWDlzimqaPhZ2MZhxjVZcEfciXmBbGZ4ZO
         9bYUkfjaxZuzBrvHQHOVOf0+RLXsuyKDOM4jQgbYRl0in/NC3aFusRDsqTH4iteUw8+8
         GMBCWmgquiernmP/QYZzv3eYU4Uyw+jMOqZ209VzLwqMTn8Iku3Ks4oP+7EyDm7WnKEo
         pE7wl5CMRLCC9SHZJrchH8YYSCa8KomewAqbGcO0okLr7KJELjfLB2RenZQu8XZfM1KT
         +k3g==
X-Forwarded-Encrypted: i=1; AFNElJ/epde3phhyERSlcux9RHjtAhOFBbHJFVhbk90MKXlTjtG5mvFpUTB+NDHUMJGzAN73ohJz3ejnCJ3c@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4nJueAq5YlWr1Bcn+X1gHHMAez92erqEX1MO71sSfBHXbNs6
	fEPE0corkoaLGTrKSxbAEylYJlUVN1jUWke8f+yneCnwxF77mhYpDjQEScrDq3GZiejEx8uwIKb
	OT7ft/4xzlJQ+BHSZ7bodc5FoBprQ/o2hrDA+UnyQTqcWY4NumITg4LKZlA7TJ44p
X-Gm-Gg: Acq92OGSUMLGAB677efzJAKJ55taeDHLdQ1Ep5cG0o0whT+mfzpZLSOkx7PCo1y72ou
	6A1KF2ycE5iIZ2EeyTpzGSOUK3/LpIzvkRqm13xiG5YL6J9BXC1SFOzdt+1HOFlSZ/gNf3Nf8Sw
	y2sfH0nfKwi8wzc3wrY4dmY90hWd0tnK3+VhrThBBaHe9b5rk3lnDGHNq5qO2/x1y48uJ3u1ap2
	ri4Xir3RjvyoVkorFbZOnwUpx5zeznxyjLvK9kIwAsHmj/qLnSicD78ZZlSMoZLrYOouowChCJF
	ZOXw3522aqYlDvCARJt8ILbqhxGwVQhuCZgIVuOZcictFU0inaG5CBhb3sP1+mQO0meQ7rDrl/J
	txEVFYSAD2HKNn91bHGkSPYvdzgGzTO6fxk5g0Qa6HVPIWuJxDsRFRRqIq8brB5sl7QTw8te9Ln
	hM5Qs=
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643571cf.0.1779190021394;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643371cf.0.1779190021037;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm703044966b.9.2026.05.19.04.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:00 -0700 (PDT)
Message-ID: <a9a43d35-6fa5-4a61-b9be-3c283080357f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:26:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pm4125: move vdd-vbus-supply to
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
 <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfXw1PgNKYfYO3D
 mzshTm8J1EGsK3kQG0TzsCymrQLsm54/dfWgZW7lP6nYBMYrxK2ot4Necbf7Df2u6t8Sj5vbFDV
 Mh8r/7CpPCbOxe7+i4pVt6uAfci7Zh/ksiEQBqhcXEkwssneNin9azcUEeEXQ8s+G39DW3QH4bA
 3hWFkqkFEQ+nT+HRJivpwKuGjS41YFVRp4Z1UbPxH210N8wsJyx4WQMx9lNz9OeeND/foNs7TMp
 tPOAAvMUacw7rygwNO4phxn09PK/iqiRoJt0X34zZHI1mEmnLUiOio5RaFmF1DXkG+G8qQ/0J3L
 bQt2wUmxEsO8KInQvUJXCkOOmgX3iP33HPjzlGDGofJbltAVTNlLVwWKsF0GpcnkLPGygLHQrp6
 vP8PuSJuzVmMdeJ+uysQpeccZx00teFE449mvAlQhJX6gT6FwUibBpYFNZU8+H/QunLeFS+JWgj
 lrUDZ8USRQYZydFMRZA==
X-Proofpoint-GUID: CHh0D6adHRQVrHuwO4qYPUOdcB-bdi3B
X-Proofpoint-ORIG-GUID: CHh0D6adHRQVrHuwO4qYPUOdcB-bdi3B
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c4906 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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
