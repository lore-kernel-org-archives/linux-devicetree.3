Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4D3FE67E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833788; cv=none; b=lSLvzfoN+DPDtFpalSl9O/HyHvFnIkkjwgI9k0t31P6uETtylwvyNBD+yl8YD9gxeDz08IkNSsAqqOHrbxT3UgCFmz2P2gNcjAGmxoLJ0OvgP97GzrCjmI11EU4/66VYggWLBEy2gJV1WCEDRa+YjyEQZ5rUoXHMyKYQcuc2HHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833788; c=relaxed/simple;
	bh=x7CFAFj5m9ZA6ar4UuYjjngctLltesIcNx9zgE6N7Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muJB+hx0FCosKPn4U9CoRED651fpu317vSHfDYwq/7wU+ufawBhDLadTZTPcWkBNsPQCORH9rC9XPTDZlaD3i9PM/ypc5/e/JobHTzZqH/leg19UjRLRKsBNDmDloonb+rwDxcEYZKdWh9Piy1hb34K5nhPUmcpyMy96j/yy8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U78OPecd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PojPeHyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U78OPecd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PojPeHyi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5eUnM4022529
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=; b=U78OPecdnUfCWohB
	YQsmtqT0T2tkg8OR8wfWdAdSEZq3xPHwMfbSnHGBgnglliTFLfpFj0vsgDPFbTcx
	m4AtF4pLinB53TeA4SJtZgf1N0Vpiz5Z3hJ4YxbWrIJNaDxOLKbodlakIyHyWPoJ
	JsuJ/gSbsyIkqCWU59I3FBjHe3r61+/pNusiKQ+DP8NTiJ2Ex8Vvbhz8r8RvJ+he
	EjLP5YqRRh41J3rDq6yqp7z/jCWYzhukQV3UwSI1I0P/iLapTdniNs3FcZyc4Kop
	IwAcwqfPkO2zXRfZK25LFc8v5fKPmZ7FZWzp0uYsCcqr/JntzL/VLaJye47bT7Oj
	eeJ2tQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtd59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:29:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso19342471cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778833785; x=1779438585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=;
        b=PojPeHyiBay2OIBMKWvcMmxVCFUPglGzC63qJtEO9s2S977C/hUPZzWWyFw6mvKPiM
         h6BQR81R5clS5q6umwxja0VXEDiG6h0fYDvq/tOzonUkcf0uJY8gCo+SJO2J8oZyRK9W
         0qMG/ZFBv01dlE9X5ljYHSwbowIbCsx8AwMpZjlPzarSaUPwXsOrYZnxDHYMNQe37G1W
         XTDspmwxgcmVfeHsIQqognbI1wzRBq1b1CtITpXcigBR070tLf47wVHXOYLY2h0MIk/y
         crPxwcEhjdo0kgKIfjtgYjXvFjcnTu2JkZd6+eHe4WWJxk93PC4+MweB4AmbhZTLps+C
         WviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833785; x=1779438585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=;
        b=Xq+XaPzfURZ+QZzcBqgL49So4fWctjhKcQjmErjmPXfQQ8jPy/EoIKzHInevJb8nHw
         JJfSApmk0yuDoDJc/LKiQMN/zvPrjNidEsgjMneT6xJ/EJ27NheBNszN/VmKd1TrRfZH
         tg3sUBiGr3ECuJnc6o0IhHWN1Oy9zwvUe/eWbeiZ0TFfDJJASxbA1GEHlzTcOqliB5Wp
         IWFu65KD6o0OX5841JslnNZbsxaNC0Xrawce3gRqKnkLTNA9CILEwOlIBTQiX/HAABxn
         0ye1luyCWDHbo7/zaJdbonu3QQ4VrSxZgedlVFckqQMotEjJp95uTgYXqsiuLzaF2Jb5
         RU3w==
X-Forwarded-Encrypted: i=1; AFNElJ8CV6n24NSvpbZSJVws6+H4ycpHO0OxV83UygRAjrdAutR3kZw/cW+DkY+3CLCnIOZnW52n/XLqAJ4p@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRMISfa+MCxcfK+EFBiwItG3kfEw97hkm50k40i5rA6JYK7l1
	q2eVYWplIJtCDwQ5tnuLsD65NkIugW0jmVZ8xX6kcR31/LsLa9ECdq0T4Iy5DWrhGQ6Ui9Pw4RT
	Cl3pRnwwhfLQKsP50/+E7FL3NsxgLsj0jQZ860mX27fv90wq0AtWcU2phdMPlEPdX
X-Gm-Gg: Acq92OHkzwiUcVS+gH9ZD2BEJie/5p9TjSAAqs99U2ey2Q5IAaEcYe2xgH1pMTkW6wu
	idKtjLpu9giFgCV9wwkN8nhTkOLoIws3+MrqXesaCwaF40pUZu65Pj1w6obfMtFu2RiygUrOaVQ
	7bne97vApdF7cUJT0QLjXgemM+1fhaApEa71SR0vc75wMU1zrmPQ519nGOisVxfAHbopMrBCgJS
	AKaOKK+BmjxrBc1fRoLv39Qx2Jzk4kxSrC1MU6FSCQmtkAHQzh6tDQLGpD6NnxEuMSKJQ4Y3lXZ
	cCvQHlLcXjsq6NDvhIeoOatz0ODgYaPQfiHV1slE1uXOp2TuYJ3CZrQPIzxEKyVMShGWYK+zhDl
	JRzyQElBbD6xxAMdRWCjOXZei2bblqUth6gM1FY2C1hODB6byZMmPUqP7XjE=
X-Received: by 2002:a05:622a:a6d2:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5164155af1emr72149121cf.9.1778833785316;
        Fri, 15 May 2026 01:29:45 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d2:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5164155af1emr72148901cf.9.1778833784838;
        Fri, 15 May 2026 01:29:44 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm43751045e9.1.2026.05.15.01.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:29:44 -0700 (PDT)
Message-ID: <db2942d7-720e-46de-a614-d9469a72d69a@oss.qualcomm.com>
Date: Fri, 15 May 2026 08:29:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
 <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XHbc8fuiqKqt4n27WgtOgoCjUBVK3WXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4NCBTYWx0ZWRfXz641/QNDzN1a
 fw6ZNBb2WvhyrzGSfI4O5dDnF4TjSLMtbw9hbj5Iyje59jQsH5AKS5u5rQo81fd9G1X7WOhu/E/
 dCp+ZBs2DdjFTEQbK9Wi3nvknH6qplzSRJ/gS9divbDTvgiH8r/P1nqLWC7g9x8GRdh155M5Qc2
 eyb7qtkE99GKKzJreM/U2QNwi9Byt3u17VdceEQhotPSE8/0crH9S0cwWr2coD0aUNObsHU7gdJ
 7ht1yQ9GJRk6cs4zyI7s176YdVAFZyxxm1r1rMKAhvUuivtfIJdqbE2UC3QsHwprU8YAXs1zLP4
 4SLdIi4X/BRp58NdQk3u/vpux51Sq9NXmQkNqtZjC+Xa72pNAqh6QPo8UubQlwCZ1191JPxGqoV
 itaWkdVRKfWfIOCn9dNM4Y6MBbmzZCNqZHOCgJev+x5c14HNf95mwCQ7LuTcvtwyfBUVHGFzFYk
 hqHQa7ePLyXZv8GjUIw==
X-Proofpoint-ORIG-GUID: XHbc8fuiqKqt4n27WgtOgoCjUBVK3WXC
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06d97a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=APSRQGo-bA5DRRouejwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150084

On 2/24/26 12:28 PM, Konrad Dybcio wrote:
> On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_audiocc: clock-controller@a6a9000 {
>> +			compatible = "qcom,sm6115-lpassaudiocc";
>> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This should be called "qcom,sm6115-lpass-audio-csr" and should probably
> have a syscon fallback as there's a lot of various magic tunables in
> there, in addition to the CGCR bits. The clock driver can continue to
> bind to this new compatible, like we do with the SoC-side TCSR on e.g.
> 8550 and the tcsrcc-sm8550 driver.
Are you expecting this to be a reset-controller interface or just syscon
so that drivers can poke into this register space.

The reason to take the full address space here and represent the HW
control bits as reset controller is that we have room for adding these
various magic tunables with some standard interface when required in
this driver.

I could have done the way as you suggested with syscon and let the
drivers poke the whatever values it want, but that is not scalable and
clutters the interfaces and encourage to use the way it was done in
downstream.



This is same for all the Qualcomm SoCs, why sm6115 has to do this change
alone? And its going to break the Device tree abi.

Sorry but I can not do the changes that you suggested here.

I would suggest that we use the existing mechanism which is more future
proof.


Please suggest otherwise, I would like to move on with enabling audio on
UNO Q platform.


--srini

> 
> [...]
> 
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
>> +			#reset-cells = <1>;
>> +		};
> 
> All the same, except "qcom,sm6115-lpass-tcsr"
> 
> I'm once again sorry for not getting this right n years ago, but I did not
> have the sufficient documentation back then


> 
> Konrad

