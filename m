Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A604DBD70
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622413; cv=none; b=B1mGIoPGV/SylELztzdG3nV0W9XHhwEzxau7QIpDZoOdzrm3OwIW0MOE3V7CXg3YyGINzvYuo6LtzSFsW9TlZvPj3HzZYRUpa7y1rkyEwxm5QKjZ8teTQlSVZV9t3rDnKnhwYQqsj6ZqyFeSS20sYZNbtq59JFxRxC31xNf5pNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622413; c=relaxed/simple;
	bh=WoPszd7Zul2Xee86XmDdTUW/wVdb33H/coSaa6iqWK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1i4ivvzRwU4k7LXe9RWIg/ZN3PDoBdaKKeweoLCfsF/R3zCF6wz+pYJ1cuTAmbhOgO/mlT8XRrlzJL+BYCgdReCBB/8A8E4HTfSF+ekE56N2Tz3aQLC4Ajcci/aHmISpqTulc1zw7SS2MVZakLiM0NeCi1UfQ0KC17gjgSiv1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrPTS+/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLhdYCId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrPTS+/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLhdYCId"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXJWT2386398
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=; b=WrPTS+/oAADzAmil
	SMnElwQCyzkotcOL+CyukSHrM2kCzCrEH9g7N5OQFQYsib2gnAGsetKWWbJNhn7i
	5c6gFEo+M9mNEqtPA/TA9/PZV2+8XD3wjMOj6oMoQQZ2CY8l7PetlPSfI7MrKvxU
	2R0Yq2kYvoAPiOrwVlQ7P8dHozT22Jwb7FBL8tr/UW47wfj9PKrx8hOH4CPzLTTU
	bXZOhL6KhVcncjEKNjzPyzpKJGOFLQxVKmuVpioohh1bkaI51Cck/Z+mCdGdGfYy
	fXsD8W+/F5goe6542LcbxLbSF2e1NHQ4QLCYjGFExQM3ghFaBAjrZYAxtnpQk5lO
	gpwcTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydvfc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:40:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so202051cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622409; x=1784227209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=;
        b=VLhdYCIdb7n3v8Q0PGPZjDktoFymWlco3rbquHsfn1oWpQyu2LIx9gc6Kk6obtJUMs
         ic60yVjLwfiMfj9fjc2GPxEqCOzixr4amFiXYvxV8wiYrwNcW7KoxJttfcUKSxwYXwQ8
         tzfv4FYoePnpzxn0DfdlZdSyaYOOvfZ+zACJwLtxIpg6ryHkLLCHOIcASQuOr8cKmO1X
         wW7zzwp1xSi7dI7AMvBwSm5SzjgQdYSoApcEc4hl6kNDDtI1qqJcKeY84XfzVQFJRmRS
         90Iy5iKKmUS4ZYAGQxdZO2gEu07AykBYN7LTQbA4Q8lHizp6l11cUqVrznQK83CkWoUB
         9lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622409; x=1784227209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvK2VkyfSoUSm5eKmSxUVkwHEdBJLPuUeqmWYrwjAH8=;
        b=LLP1zlE31RL6nBvCGh5REOIXJFzRuI07aYhOQMUJ4hnSBYb1LfAF9yVX0Ckye1cIKr
         wHT/EqJFpWgIpCsUsPqGrOfEOVW1D/p310kIzOn1YXvna+GBWsce82vpKe8p8TCT7Bs3
         nYFOl2bcNXsNNzvlbeE87vazzPdZhXTso55zT4Jq/KmhKhrSLwRoznyq+4q9Jv3gH2+2
         +EJhTgQe0WqchT99LO7gUus0RuUGn8o3qoyUzvq4rXC237BCTa8MgxUDu9eheGijRr+d
         tBwl+pUeOpbVUn51grog2kbBt8ybvQTEey7wCdcP7t/xbtHvWWnyAKtEim0FkQx3h3uk
         8Kvw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Bht+wlvn/KEmEpQsVzMgOH7t99BsbHo5ef1HFgY6qj3gVcjFc4ewiEGoEv9hYWPp0eQi9D4Qk10f@vger.kernel.org
X-Gm-Message-State: AOJu0Yys7O9GAVxANXc1dl9mY2htlokSLC9O10PH/HlhXkPgNrtcEGlO
	C5UpUZyIzWct14MfLALIDkWq6XBl4567KotsyyYszCY3b1obcJ2VX1fsHpoJj8ihvHxyJxeUSwk
	K2Z2+ttIYXHIDb3hzYNEoQ7v7hX4Ga/Gc8eRRdmm6M9BqrULW6pPT++HmTkc6ScV2
X-Gm-Gg: AfdE7cksxvkIHOdMxZi+0LBCi3yXWn+8OOG7RTgnX/b+dwkPpB7xCHlkRpDNQPND0HM
	8rdN2vElBLu7DJHHZeIY5m5PHEFj+bj6ImMg3naM6gCv0XGLFlYEKZ5ymmp7qRgXi+nLjDmMWd6
	QCLUetOVT3hIEBaAzHRJNRn2ArHPYKewPOY/Tj4EwejpeubrQbdCZh3EfWaPS9k9ePNJ2j3ap9A
	irh9ipSACPDA/QCZeHsQlYgHNWt9K88H8oRChgP/EZXZNz9eXVGM6nHh/rB/rC7DNLSdgy2XBSv
	j7+PfylQ8S3bwZXC8HJifVEwIgRmJtCkQfKGmLqdo5C9valUSA3hUHrKbt4jUTXBa3bdfAri+7C
	4lvAL/Lum7g1XulpSPPL5l9SzUcZywAEJvUE=
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr45702661cf.6.1783622409200;
        Thu, 09 Jul 2026 11:40:09 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr45702321cf.6.1783622408743;
        Thu, 09 Jul 2026 11:40:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d026a479sm312642766b.18.2026.07.09.11.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:40:07 -0700 (PDT)
Message-ID: <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:40:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: George Moussalem <george.moussalem@outlook.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfXxneBB09+zaGR
 R5ykjRy6cslJ6eOBrgSPM1T1PMAVjxwriC18oddSguHwluvorKMEDhRsfWMy3Yjt3HUl0gAJZ1b
 WdNzIa7vivCukSZI65TohFRWYI9fvI0=
X-Proofpoint-ORIG-GUID: Ea_N4ExPrOb1qtVp2dWK6FyWZA_oKnSQ
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4feb0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=u0gBZgl664NcPZBul88A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ea_N4ExPrOb1qtVp2dWK6FyWZA_oKnSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfXydBmyx8PLCgo
 Tu+i4hiB0kPs9kg2wkVrM/rCbAidzdNEnb87AFoYE+E5zch9opMeDYhjGfTHqMBd+8pzqGzIxts
 Nb3+ej3835Jya0OfwAJpKFGqNLOFpyHGIOFaohovXxvNprCG91/Xv/Lo0S3rWXoy7vXNG3MhHwY
 L6+l6duCyCl8T3KZbLktUwbnkIpvATXMRCt/Rldw6RWJC5L9P7h3XKDUY8cE6STMwe8Bf4RWx4Q
 Kq2Le6PxGl9gLrUjiluHbCVCpoXUszPCNNC/BZGIAB0MjMuD6LPN84ueI5iUizie/lCmIAWr2O+
 bdtsjBF5+NDMg//O4fHSxLvglUSmn2aR+BvIMVstix9etLrVBsk4IIXZ5V5BldLRL03tpiDcEGJ
 9sQgAbl2vh4ZCwUAaum1cUQOeEAFhA6kdCAB2oiHegoMewA4C0MJxmGrSwALWWemXM4HSCS/DkZ
 wKBQsJlOZJUgHvqHszg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184

On 7/9/26 8:25 PM, George Moussalem wrote:
> On 7/9/26 22:17, Konrad Dybcio wrote:
>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>  			reg = <0x01937000 0x21000>;
>>>  		};
>>>  
>>> +		bluetooth: bluetooth@7000000 {
>>> +			compatible = "qcom,ipq5018-bt";
>>> +			reg = <0x07000000 0x58000>;
>>> +
>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>
>> Hm, rethinking this, it must have ipq5018 somewhere in the name
> 
> I agree but all QCA BT firmware and rampatches are published in the
> /lib/firmware/qca directory, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca

+Jeff, Bartosz?

Konrad
