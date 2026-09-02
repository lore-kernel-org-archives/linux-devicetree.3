Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B246AA6E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345764; cv=none; b=kWXXMLY2mhM7CcX0qAo9le1MKZwIu8d2Pzmt7EdMl49ivmm4Hq69muSzRkRr4zMr1LNkGtYYrM9pzG/D/Bds3em8QvBg/B/o6J0b819iWDhp8fod0i3hdQf1Dl4smO58E7PO92TDRvJOMfn7kYtLQkNQxSFfwbaltAwD88uHvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345764; c=relaxed/simple;
	bh=qbL8sF8H6BSNGFEBDA7Ai6ATlzn/EeqDn7sFEbF0jkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtPa6KCBlrH1jl0JI7kLxdatpr0viMlGGHYj9jGffvFiPA+oYgUAYP9jcun5mnNAWQTLwEud0wwo9nSEkKrXTsGsEu/Ox7d42AcgrowCxWLZn9zU7JztFjndLFoPXpeJwCbJtRJgxnXekVFPH8xjY3cx6qMoMj2Gt25DMt26plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzMYh934; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We5IpDlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzMYh934";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We5IpDlQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829Mv4E4141408
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=; b=hzMYh934w1KQku02
	SJqNfC/emh7EcYvlzSk4km/GFTM3MDwKTULrgVdIPioyh88JkflrGR5WHUwTYnoX
	Hs5i+FryaoQrd5/32FrtVAzgAaju2R1NdPLbQw2jPAAM2/4qtL1eY1EtjhgHa/Zi
	Eij+g8skUxvvyviWHOoxrQ3ca+opBqsvOUnIhtZ81rpaef39Z3HO6XBxaHAtYlpT
	3IcBhvysUJbSyxZfobbJjkUMoUjNd+j/Olau2dvH3RRXKZ12zMVa0ij2hp7yUXm6
	j46wvKqn7WcnAyV0q/mOD9oWK0tH8gjnjhBPLsmmFcnoVDJ+F+oqFBhXEhyCPror
	VK9iAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckedn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:42:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffd22d2b1so1839571cf.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345759; x=1788950559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=;
        b=We5IpDlQ94O8sFou4DOi2mILA6b+RNznin4eoBuUjZ/U/aTux5dXOXS63flNqU8bLk
         9cLIvhoOdBOz/XD+GFfqi01HFlMt1sY3rmHnN+IwOXu5EUk/AU0Otvv/jn9F30VNjbd6
         urkKRbrAL//qVGphyG8vY7ooW1SCOunu5QT/243jk3keyDTzctGi8pBLA5cP70okd7Eq
         zfXdm5hdhClv6ZquPxeHnm0JzNHEy7/wS2h2rV2tdM8Qv9cokdDqu0uykrbxHNHSAT1K
         YcQmJRvkXulVCaJk9G+KQ9aWcCWOfMLSlNw0rgRpQFHfktHBsIzXPrDPa9/UsypGVLgd
         5LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345759; x=1788950559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=;
        b=WwMtoHt9hEYUxtB/UjjpqlZY076mlX+wfBFqEQGAlFOr54uMUYVBpoI2goEFZOmmfo
         lZfR57M373V44vlmycnooyVuFGht8KTdbPl/4YL4OUoPmtXfefxn0fkT7wIp+VvNk4j3
         mDTtAofPfk7v7UPPYvLqHaHtckZaRxl5uaLkt+LAM1V+UAM/yc4EH0FgSgvsvbIWYMrR
         Zpfe1W0EqJTHpkvgcjzB/iX2JBabr8UXJ9xfj2zTRxWnrnlZfD2CgGnbIoYIMfKHhPo8
         Cl3WUQ8uFF5jX78NeLRbXut1xgX1bX6/hlLOa39sflN9JBHdKQK+aKY+34Bc+0W4lfpS
         nEuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjRc+KbSgn89QlFrMya86QPZNjOd6EtgcNlrlItc2NBYH0i5VvZjWqfc6AU9AxxWaAyan1KchinKNH@vger.kernel.org
X-Gm-Message-State: AFuF++mz3yGIuPcE4PmeqEvyzuZQmsWfiMWSuiZr3GOOmeCa0kqpMb3v
	a+ENKZKA1WoEjtiXUzU45y8RNedoDqy7h2bkmiQfm9APuMp27TtukoinJKYwX7+R2LVUdAaT8KX
	N37BlfTU0ENDzvbyG+n+1UC3fwJBnQtwU3ygLJRXUIm9UMPuqeaKrmKEQvdIQFq7p
X-Gm-Gg: AR+sD12OnRlo/CyT5hZDiSWQb4GU9zFxexqf1qhK2nW/rOMgVwR6hpN0AND9yV+DYXG
	o9Eiup2bPoolDszU44cAe5cszhVqGiWWxoj38IxgVLYLMR+rdKcRlRN6buRjoIr25TyBFSoKTqt
	ydlqn8RXZlmfeKXRj+NRTCnc2CH3/uKN1UkJWyRYjKPv+aesDNZ7H/471WaRVzZUK+H6PTr7WPI
	p1svWaqQyopja9naWFY+t6n5Cxb/MwN3b15PrM5YXCZo1d5T0LrgW3KdO8s9hmDnooxLmOEG6Cs
	iQcJfnsBuNafNHK9x0WKBIUwUFODdStskJRQnQOnrCs+raipbBoCmsIpNiLq7SYg2QAg1l5rnaV
	HmOlJhGM9mcbbNfC/JfRuog==
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr23818011cf.1.1788345758818;
        Wed, 02 Sep 2026 03:42:38 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr23817831cf.1.1788345758380;
        Wed, 02 Sep 2026 03:42:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm876140a12.30.2026.09.02.03.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:42:37 -0700 (PDT)
Message-ID: <f4235ff5-6bdd-45d5-8949-389328a89280@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:42:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add
 QCA8081 PHY on rdp432-c2
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
 <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97fd9f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nlvt5-eobG0rQS_va64A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kp3sRZk6-cjdBGWPdO4EUtySY-0uWDRT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXzcER4eqngr1L
 NTM69EStnrI//UM8YO6TlWaEtE6QBHHp66jDerYFsjOqVXVxR6izdHlivKCCknKmM2D8i2qztU8
 nRIcdvlFrrUwjuVnA6P5OesmjyZjTt8=
X-Proofpoint-GUID: kp3sRZk6-cjdBGWPdO4EUtySY-0uWDRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX6t6Lb8h+mTC4
 8snE1HcHTURf/SX3fFmmfvgupUhJWkiZpjqczhPSLLvoAGdFJadsEyZmK0aYjtdO08RpvHVCSGQ
 3mChf/g8rC2vcuJOPERgK8WWHnmN7KvdQzSGkb22sz22xnFqOrb39fh5dcrAvRm32wA9ASpVBCm
 EDs2jzoN8761RRNLzoXuhhB9PXAY9zAEdTswZUENrPztxhYbEq0UbX1T1jF8dql+FKe9B23YYih
 0ZsGOg3efQw7/OiMNOe5GfQX3961u4bfr78dZrWHECh0hVwdGajAP6oTLCxdxrR05zNNKQhbRSg
 dM4Q2QsQ24LoNZe5mRPbtPI/f1+uDd1pr0bN/jL1bB0QRqBJdM/E/W51nrGHprqmpITy27Qrkq5
 d9gaoy1ouuVDCFhkNd72xoWsz9mopNuppvCXVmuGpGWdbgFwKRXbTKo/vhxXNIGSA8ZQj8XwZLz
 L/Kwv0S5k/fnjWxqI5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094

On 9/2/26 12:22 PM, Luo Jie wrote:
> The RDP432-c2 board uses an external QCA8081 PHY on mdio1 for one
> of its Ethernet connections, but mdio1 is left disabled at the
> board level. Enable mdio1 with a 6.25MHz MDIO clock and describe
> the QCA8081 PHY at address 0x1c.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
