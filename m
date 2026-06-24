Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EF2F1FE3
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295340; cv=none; b=tEyvRyYCky4JYuyyJw7go9QtZ4f+ENG9NCK1nyArrel1XZCowBbAEX8UGNRTJexaXeeD8OglwxH4VrXRiAyhkVSCeFmd6eBVaU5hiIp+1agNZWXEnvJlXdabU5lOFLMr0p+FGjrQP4N2lbTlvL9IazuDfItVFxRDg+yaJFY4tT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295340; c=relaxed/simple;
	bh=c6Ala/LN35OCe8hXY+Yh9WQlpumX9jDypGqOUneSwK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7IcbO4q2BritsFf/FTkZi7JfB18Y+sj9SSfBHm2r2lULHHx7NdsL/gMSMoCw1Du7q6nC8YHOItwIRue10046YOUmUzdEqWvoC+x+BZTMHYNqGhYIos3B9v/6Rqf5qhCYS77DPLvPdbKkCpWuWBRmZSAoNmu3VQs7YdOCAmh60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i912ImYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQBIlyif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i912ImYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQBIlyif"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uI1v2460783
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=; b=i912ImYpBHu7kp2O
	IUm37zBlMJo/sNrw+cbrakYxJLUEbSvSflXxqtWSr+EkV6Lhe0GOQpjJF6MHgCJE
	YV+jTLX2ocfi6gh5PRNQn5lPft8N+RkGP2NYMynk4zYa7wtSzpjBaqROSOiE1AeY
	zIjFWeWoeakxflp/4Q6wyPQA6vSHx+65LNkQqucbWPF1KjZUNcL+JoFFaClKEtGq
	EWya2guZc6WqYO3YDTMa1zZIcYP+tV+DfW76jj9S7ECG9C41vpNcj2eioF2kAvfL
	JLugNKy80fXhcYcgpDU3/2E2+H8p3x3TGLTTRQcAmZjb48TGLmuRd6+eJ9/fziDF
	o7DmCA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh494s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:02:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8454912a507so1636681b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782295336; x=1782900136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=;
        b=aQBIlyifdiosX2meqIpd9CdEInMDVYJUEunjBlvXCtlkcrp3cW46ZnB90L3dPiCR4+
         /GalwABBuwpnHGWotuxO9NSo1ijP+8p0p67sTgKIzNp4UEJBfK6Iy8al/2yHx6bgylzz
         HATQwZOGiFB3CEHghwhZphOWDTXtaEEkJGzozxpqEXqbgRSsXWmwhZPuz0TN4P2fOm8F
         Db1lPEW6sW5T6mVtElbjO6h4sf7WR8u7uG8FQdIPUf4pw/I37MNRs9fR+ylauk8V25KQ
         GoqirBG1EAJ0MTBOM4XR2Bfh6PT7s5GSkc/jHV94BUMDLldzb3pgEJvhS0s7Q2r+RCnu
         1udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295336; x=1782900136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=;
        b=IHmxLx3Ilmk+TD3Wvahg+uOs9OGmRv5REiFjHssKMLaaCdHxznpGgNlUjxCE6RRJ5H
         XchQEOPGo2qjSzknwrY7zcc7oAEBegg0Zn8VAJDTlvN94K/94IFLRMdf07xtqGgWABIo
         2WK32hmwBCr6dxGwCzSqMz6fT1rKKmIk85E7qrdC4lIFP8X1DsNehgBSMAL/SwpF1OyV
         zLSrz2W3FevhGkc0MvoyU1Uj6/a2XbMK5UohA96wD0zvqP08wKpDUVP7pgDBtTTPVa8L
         qG2J4QYDFHRWATHSZ6unvMf74Vs0iqbLkbPrFJl7VhTJAnnccxnR69Y4m0i77ec9AKHs
         bBmw==
X-Forwarded-Encrypted: i=1; AFNElJ/RDDk0QRXPXDF6OijRGbkILBlMYPp+KepyDwrIUg27GujcY7ZUseV6atVeevUUy7+GFyBq1tXKE9kZ@vger.kernel.org
X-Gm-Message-State: AOJu0YySUXIwoEyD6eW9rmtMlDEf2/4hllIqqu8RchE6+i/uvdM9UWk8
	ZmsV31UNEIa3y7MVzVd5AZuhm7YMzaShX9818z4hx46cyXdbEGDzk7WOAobGFPV9a3b0GVy8JZJ
	V9pk3ntNh1thuVHgzCmK9FE8tKzB6cLiU7fUMHkmlMe/4OSbtOJvSK/1m8ot9etg4
X-Gm-Gg: AfdE7cn3/n5QP1Tz4/k4BmfLNibyFt9RUlJFBrXZULQfS0pjchAnDMxtOcmRCHcOzvK
	MSQWB4nQm+UsirQK6+k+wwoy6VpYQpCyxk1M3ZfTBNVU5z6toWE+EWeuoqhQOdZFE38S0xfnoM2
	p56ikafzM6V0qvixxZualO5866N77ccNgsfrbELgHFsEnn18buyH9Hny2bZApOaLk+wJf1Sv8LL
	0DaQCXVWype1fwZsAvFpK9m8mRvabOHi1DOwhZCBw0zK73nMMnmvtkXOHjBDSdZN7aOWgFbq0vh
	GJdJYt4qYkhDqvnhWVovM0HoPH1S37WQRRGbropz2x5McRfepOp69ucSxt/WM10fzlR7jU7yK2w
	HMa2tJFTSQAc/OoDKdzO9OpB/bM/x9cQ15C758VaiAx0Sl9a3FJFn3hwwBjgs0lgV64TQjm2RsL
	f8rgmjY1wQZn8qIcaY5/o98q+sDa20ww==
X-Received: by 2002:a05:6a00:3a25:b0:845:4e67:1500 with SMTP id d2e1a72fcca58-845a2c82cd0mr3806485b3a.24.1782295335637;
        Wed, 24 Jun 2026 03:02:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a25:b0:845:4e67:1500 with SMTP id d2e1a72fcca58-845a2c82cd0mr3806431b3a.24.1782295335141;
        Wed, 24 Jun 2026 03:02:15 -0700 (PDT)
Received: from [10.190.200.172] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7casm1795041b3a.18.2026.06.24.03.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 03:02:14 -0700 (PDT)
Message-ID: <65362ef6-eb42-427a-8499-23f609621369@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:32:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
 <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfX+3UvTdY3Dz7u
 CzyeETSiS85ilOW5VAWQnET2T/4Sj/GIPlQTw4DRv+NriHPmG9us6EZQAI4TfOEnUJWk7o9KuZP
 jKd/xunwv1lHErYmmcehmOG/m5ZI4a3D312UdwyHi9SlmcRt6NsasB7tnSxyIid6IJ1bRcknRb9
 EtQ0GZqMR3Qbqo8+uw4gB5PzXuLtS+7yK4v8h2h69ZaK6rE9noGD1JQQwaFOvmE8cTB4SsPmkJg
 eXHRa2vk9m+Sy/eiM+Nqw36ccLamvwSh9VeiAyFWH1PZyh6QlQZKnwyF0DSFg8BmgxNvuO2w5c4
 oJNwnfnC4N0I3uIN3rCbUr5NAly2htUqdYW53UMizoVFzgfnQ1df1KEk5XhVIMC+oNLyzB6rI3V
 Vb/gjVpqMEbIAnJ2n7i4wrHUG7u2ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfX2tTXUHqjvYlu
 cLqQUmFpmZNJVIVx4UrwciSfsqWrWU1+QgZ57apOAFpUKoeyq+dS3FHTaL/l9cjHBtyqPVh9Vwi
 zieS9LDF106fweMhkOYLpk6cvI0K8Dw=
X-Proofpoint-GUID: THGnAmz6s3ddIrYg7R4YZY00bvdha5EQ
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3bab28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ERXISu5ESIjULu5SvvoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: THGnAmz6s3ddIrYg7R4YZY00bvdha5EQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240083

On 6/8/2026 3:33 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
>> The Glymur and Mahua CRDs use the same board-level hardware for the
>> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
>> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
>> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
>> regulators and pin control states. This has been verified against
>> both CRD schematics.
>>
>> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse with the Mahua CRD.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of next-20260518
>> - Updated subject to include glymur-crd scope prefix
>> - Rewrote commit message to describe the actual shared physical hardware
>>    rather than the code-sharing intent; the commonality was verified
>>    against Glymur CRD and Mahua CRD schematics
>> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>>   2 files changed, 396 insertions(+), 399 deletions(-)
> 
>  
> Hi Krzysztof, Konrad,
> 
> This has been waiting for a while now and already has a Reviewed-by from Dmitry. Could you take a look when you get a chance?
> 
> Thanks,
> Gopikrishna Garmidi

Krzystof,
We've verified from the schematics the soc gpio and other lines do not change and are pin to pin compatible with glymur,
The only change are the external peripherals connected

Thanks,
Pankaj

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

