Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440993E022D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794539; cv=none; b=V60iVxZGDNgtRP199IP5v9lIWEQf7U319PmEOvgqbBjEON/7bVZvl0joge4WUOfz2QDXl33APXOKXVpkKCSpLO+d1y5JhYUXpecx4NsQ0VC3pcNnlhzpS7EScvnP0nXew0qQ67FY7gHgTmJG3QaOArLOYFTTstR7Ua3HWmoHzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794539; c=relaxed/simple;
	bh=tRGGCO71eDtxTc4WzeqTKxldH+vPmJ0nK7h+b1NqrEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ES7VQ/iYNwcT9Xp1ojMnVSF6A272toIAJFHzC79Xyyvz3pJDcR/rw5GPHXUQoqFyvvS6pap1Quj8JRWIoclnkgKL5yf0MKHNT7670HcAIvmd1LPrQo6Lka4x91fZyqp9b15Mnpxhk09yErbgZrrCTyZRsqkqpKbtwBRboHutLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hb3n/hA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=af+v23pz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hb3n/hA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="af+v23pz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8K3fX4117449
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=; b=hb3n/hA3sWQtchUa
	2xujjhW8UFehd/jQIvqNS4Onx5vfZ0Fg3WtxZ7hV5HOGt7xdXh7nUTbiBm+YNYMe
	gQtinOyNO2/Yq0XJ2SKoBdbTiFJujZ/SgmMpLngi3pWKVGq1w/h8VyML2VqiXOac
	87YQ+M7pJmuitSQF/YO4zUFd5xD5n4uksLNJ7U6JGrW5EQ6PU93pzMwhDCU3smsa
	w5sPvbbq6y3YY6wcEJ0T1ePLvBYY2DHNNSa8+Oof61vpNNHAwJILd6hXannEpLe1
	zf/tVRz4/b6Wu32plhVZVYohcdn5fCOuMRPhnNEer04wjwl5gY4w3oU58SlnSxDu
	1eFnwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbmbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3690777a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794536; x=1780399336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=;
        b=af+v23pzU6bFI40+SF6RrvY3yWGYCzrNxra9UhlNRggnKazVQH31tpi7ojxREfYWBz
         X7bnl/nt+hCS0i/tjMFMtx9N+KnzD08uX21asq9mdR9VniriwgtcOJas4lBLVoHLMZ2/
         ndzb61CYfcx+N8hRzRHzlzyQ8XlqpYNuBEywymTPKMDGQaO4/PXCq/uiv71EwuVKBH9z
         ueURwfJ2f3TUT8Rqpbnpp2L4cga/YoNOFXj8JuGlYpDm2mpZi84lsF1pQ9XB0qauJPtU
         KuQq1X3R8rmKBVIU2NXRFunx5Vge0CSrV6W58tU1Y6sgl+YW4+zwlHHZ5RpJ+YrMZdyS
         e+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794536; x=1780399336;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=;
        b=MgbfHIQ3rMYqb2OCOz3NALFdSntsuFxKfnPAmRTbi6V7kGA1toivicLIfIaKQA9Wyk
         Zg2+lcDA9ozvSCBrGT5mKgvsrhMUURRfXo/HHjis9Kd4xuSD8lVd6eHQvYcpJ29swxxB
         OMY4tXtdtukm5Km2Xdk2s0XIfQT9YiwTdvNWoLlj2lyRnaRrJZ1QWmybDuMzcbQb2Ar2
         6O+0VH+OEEwg0SPf0GDSETbbXCLbV+56y5hnRHRaWgLi2reRkqxcW1nQWuzfKIKiZI8O
         4Roo/QFDwpbB6X+s0lOsRZJjkISGuotQAoFoItde2RKIieYjreAGKBlMmGLU+jD1gODA
         ZrMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h2O+yc85LsG40wDlGLjDo7TvGItnnO3PEREVrHdnpyl1wMKU9ZwPus++lwO1i39ft2DcOEyhUWq20@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqW31KBJNuNsmlpYmsDsv3i6LolOdbBM24aADbC0Lg0+tC59s
	ToPY1uui9yxA9plt92k1cu6HlQynEsRxSm6vSHZahnh/6eu0dLtKBDYAGtCLtQo4sjR3gsKmbYe
	6rv3xAlT2YSMke73Ytn5IZGAZpsLuNlDuotzEm0URc1D1TZJjnDbtNMx2II8g0Q9I
X-Gm-Gg: Acq92OFhmC5I6XFnO2/aJOsEKGMTu5QtXbWxZVWOeTith+QoBQEyJwbUfcupyeegWHF
	kWAUZYXMq0BmJjmSYhImkJ6JhJvp/TERCruKUHnD0dKyP2n4pnk+MRh/Mz1UoA/nUPUf7M6lA/2
	4YCVhoWs6bByT+pBMdMV0yqJzoWZaVDGqDx+jKxc6zY2thBppsi4K8Jz6FlsRNqHx0t92HI2jV4
	WA7LUfGUdtlU4DhV4XXrNbzc9h5Ln+ZiOwzPKkS88KRRM2pV3Gwd0CKOj31G/ScKFPgIuo8liX8
	HQ/Cw4gEFgfmv6C1k9HM2Qr2jGqC2VUz5leowfIRQ49SktAzAcQ+VQXK/sKd+aDcPhZZ8rKTKYS
	Y0kGCeuC3ov+/HJJmhvpGeB9jr6iA8ZAsgPQbaC/AiKYDqXd58Aq1OUeBesZT0fMa
X-Received: by 2002:a05:6300:6d8f:20b0:3b3:62be:3241 with SMTP id adf61e73a8af0-3b362be384bmr6464398637.8.1779794535876;
        Tue, 26 May 2026 04:22:15 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8f:20b0:3b3:62be:3241 with SMTP id adf61e73a8af0-3b362be384bmr6464354637.8.1779794535248;
        Tue, 26 May 2026 04:22:15 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm14725994b3a.10.2026.05.26.04.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:14 -0700 (PDT)
Message-ID: <63056c1d-a191-996e-b556-e636ca88637c@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:52:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
 <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
Content-Language: en-US
In-Reply-To: <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x58coc8ZSZ6jEqyzQZiXEZTmxG61vFLL
X-Proofpoint-GUID: x58coc8ZSZ6jEqyzQZiXEZTmxG61vFLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX13/cz5KeTLyM
 Bl8mMHsAxb3Yyy8uTxHRAsnLpc9NgBW1YiD1dnS+22BA51XHQP7r3eHz9uX7wUs82EumED5zpB4
 v4cLL/jMT52Jyln9EpeS8BZqU/AnYvKFRcHIK1p55tvBXY7TPRFGElcnoVPSB6sG2zJ75WiMg+g
 W1ATu6uy5qF4PlTOXPvlLOeS4UpNQuTn9DrRneS2qgHTLxryEKKZBBmEw//bxJBwKlesAizOq+B
 N8zHuV0pbvZ08igx4HpZfDnGWZ4WFqcGxl8ZTIMG4zyNMmWeIcytPjasNu456oBAQVokbYp2CaM
 FzsozLEIzyjMgNnVfecBr/O33sqIo0DniCFzYgNQuFvtqzjvN/Gj46DCPU1ajPj5jgpfkZY+u39
 VDpzrtxrt9cd6CmEXa+olwMPa7jfFlWio10tqgPaXNKojWUUpZqTcmwa9/Oukij3ywgD/qBRbf1
 vvmgFHERRIUfbP+Z0tA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a158269 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=y5j-N_kvQXTMkCsvIs8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099


On 5/17/2026 11:41 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:28PM +0530, Vishnu Reddy wrote:
>> Add iris video codec to glymur SoC, which comes with significantly
>> different powering up sequence than previous platforms, thus different
>> clocks and resets.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c47443174f97 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,glymur-iris";
>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "iface1",
>> +				      "core_freerun",
>> +				      "vcodec0_core_freerun",
>> +				      "iface2",
> I can only assume that it is "vcode0_iface", "core_iface" and
> "vcodec1_iface".

Agreed, the names are not self-explanatory.

Krzysztof, do you have any input on renaming these — It would break the legacy
naming convention followed on earlier platforms?

>> +				      "vcodec1_core",
>> +				      "vcodec1_core_freerun";
>> +
>> +			dma-coherent;
>> +
