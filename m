Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598033;
	b=ljaFCMUAgZ7dCa7amAOv20itcpRCR9C8n0YqMKvAypwZSZUVi9dVSuTbGiQvhv0vcyEd
	 GSvqDcrlozqxjD4ppFsGYWz+1W1TdHw+EXkMsW37W8XDUCEp8qawc9nRSxVOpdXH3r5wF
	 JcC7otlij0TKsGA8QRcivcHFTxZqDSnkn6xJ1NoYCp0du5hHNdMQphELe251rmmF9raYR
	 jDGT7FW1DL+p4GWydawxPzHMjK6WNFr1y9mzOioJ5Dq2jD4JtWqKwCDePQ76R0uPXD5ZA
	 h204a84LY4IGqz0duQ1h/WIt6QG++3H427VDen0klxZh51BIdjt9Njjpz13xXN/e8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
	b=t4MhURohInG19D5aLGEWm+1BQo+VfQnaeqMBCJLgYtfCtvsZ23Ij6o/iX5op/017j4yz
	 ALn8PdpJmkdqvlFfv3UPlrtUUna4b1D9sg9M1bid/YpVjI/HFWBlgcKt17cbMoMZbJmC2
	 RlxD+wk08zCmSG7rMH4d+vKKumLH8rEStqykAOHN3ycipoWQLuYIrMkhxkeVVij4AuHMZ
	 d2XpT8wlfKUjElijecE5C8CqOLXxJDDd/+Y+Gpqz9SK76ZEuir7CCX5rO3k+Bvj6xmw+4
	 tHZNBNo4xQO4X4bBaH6mgZo8S9YOEAtngD9CoX8mbuyDuwe71RXcT3dqt9sLzbIyk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D7D606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU81I682552
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=; b=cMgbQEQ7VfS06ZuV
	BtEiyMgpVn/N5F8ms7jbbXwaqMgAMC3WP58dKYhowIdj3zPxCgf66HFt0ZE9dZmZ
	MxEQ13a5bmyK7eGoj/nn70Opst95clRXvvI2oUwD5bb9DJiP3MKZlji8MMDYwsLJ
	reApLjQF46W6eHReycSp0Zjq7kUbKP86SPTQZZIhV/iYkX1URRGEj2eBsZ/3oi92
	quwmglX5GoM87OuYqQ7rjVS1y0RAxtc9PuW3WLs2YlTkPywh9x529DXSQ/33w9wn
	irlIFGWzaLByOOZHZFSsiHZmfyqKm878uaaX1sgPwiT+MPnW4jEm2Do4MYWTmS7s
	TgS1Tg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrp55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:53:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1013672c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598030; x=1793202830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=dCyHkpKrzlecjH9q1vhjhUL/j4PoPuvOk6m/EK0otIiAUBpIYTt//wz8ZDstaNWR2A
         tlN6vu+hknNgqkMl/WFl+N/9iNxjIsbXGBfKENlDhpivdT5aVIwoA0IGFJC1vIxYkHVS
         ekcg38qAqbedb42vE5qOuzkJHFlqzaZ0bxGhi2X+T/daWrnRZKbs+2bUbl5+P/aiMD/b
         Y52Vo7wM50HB3nhxlgD3dSngWycP0pHN2cJDIw4HKs4Dz7WzicZMmKqaiOu3t+ReW4MB
         UhA4EP4EhbjZmIaVZHtoeUaBRHorw1uEYJMZFp116elXK81xGCa7H724v0LoQUCGG3wE
         8T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598030; x=1793202830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=zB7zglK+tHFtUhZ+FXKZVq6+Cb7OUbuazgf3cgneprQuI4w0yPLvduo54NRc6lSA6r
         TtgKZZDeQ+7RRVV4kMqAqePIJt/i+/lZzDybUtbbDQRrrPf70fUPYpItZLAGAWamvxsy
         E61dxZFvYCc0kE6qxm6jWYAUn0KJskXzVJuobTUpMpM7xBiJNyy1To6qOs/8lvStkmNi
         D0fBhsp6QaRA3G0tO9Q0SXTqbOGqZuuGVrRb3dkmdrkJ7XP13TOw4qCZxMT6OnGZ5EY4
         NBojYRofxgVmXxta7nAZSvSyQ6i4INJiRaPNJKrufuMI2+q/wvMiIn6y7Ox0KPPOd6tt
         rMDg==
X-Forwarded-Encrypted: i=1; AKwUvByZt1dSSTPVn0deHH5fCAiK1ikRmOkXan2xAArsWTstVA1eGkrBkGrq/9TXckmJGmlx6FgAJLX0fWEh@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+JncgrtimCIX1xnFGU8jsTGIvDxQG5xQRTio1L0dBaJ34XHh1
	SSKMv21DRfNBwghTuFVJEbBCxfmjO4ohfIuIz+p9E4rt159eD2wcWrnifYeZ5PZVmGsWM0px+jp
	4m3q7oHWxGXXZd36BR7mgX84pgJZC6oLBsoczaDoHN2iL80cpzrcFKPbSRuz2CVTl
X-Gm-Gg: AYBFou1LX0RPNoeemuvEluTx2osslxG62y97kUjS+183WlKc7ufbdho+VsIrmHR0lqQ
	B0uDpSTmwgwJBHxFT4gPaJ7s0lHo5krN5bWu87ec6UCGeKR5DwxgG2/JG1O0/bU5+Y4IFiUk/mB
	LrjHNdGC31GQ/MZF1qZEHy+vErpMqSXDlDROpgTTW2QMuiTFDbz2P3QheKxRJ673n4FcULGhVHq
	/bwn28N6ScJ+X6lfUZw4FTNlYhqpM2WbjVQNhXjhdvqKWXejDlpHN62xqgYDs9zmAM4va9n3pRz
	LJQ9xC5DJ5gs6x7MOzvPqQojlLlY1gTdjpfjXFKnNnouNRvYpwRYgMDJHqrC8WQff7hPHICb4in
	t/eXF/1BJBONq+HQXAG6ruivDgVKWY6A9RX8RY4j524zl
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971978c88.35.1792598029942;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971949c88.35.1792598029355;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm11144550c88.5.2026.10.21.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:53:48 -0700 (PDT)
Message-ID: <b9924970-16f9-4c41-9b2a-a5d3b7958c95@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:23:41 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g6PDBjtnPe2mXy6OW5Q455UfoXdr1weo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX5Qr8EL9fZJWL
 Jm3PJfzgrhpAgNL7K6G1+oIZ12t5aD3eXOBCFOEddfW+jePX0BmYRxNZylvS7IkVvCaxHRNF61r
 oLhxIjs0e5eiu7aflV48SLdW+4nGXS8=
X-Proofpoint-GUID: g6PDBjtnPe2mXy6OW5Q455UfoXdr1weo
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8e00f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aSm82yqHt_v6FYJ1XLwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX7Zywij2MQXoe
 zSvO/zwK1EW68iitH4jNyOOxtJ8BXHJR4tIwl/dEYNUCUaI/tOF4fzSNodQFQWyNRqAWJg08o2l
 RchaQ/43+IEox8GI2M7Kgz7A14zX5nxksSv1Pvu5pwKgQJOgTaPK6kZ1sQOwAfhfa6G+6h+raLL
 k5FqFJsVPoSjqBIzyGySH3bUyqr0foCeuB+ZrjRQpOvlcjVvub1SEp6qKPbkQxq7KplbVQn6u+G
 alV9Tv/Q+/H3KU3BE7Ws0NFPkj7UPSaOFMXAE59uv+vTDZUloX0q1EcWOwWGmTbZKtykSyewFU8
 9eLhT0c8ZykaBb0QobPzFiBKOIW57CZogkKquiho1YUaY0mr3q7nWSV9NpA6lJBDfcwuN0w/CHA
 IjebDOAcX0D6N4rEkqIP2cmrdBGfVEasdq1q5y3wP8HhhCEzIvq0aUkCeDMsw5LG0o8yZ16qzdc
 4p1dUhD0+FXAue0ByfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/16/2026 7:20 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
>> that provide the clocks for the A55 CPU cores and L3 interconnect. When
>> the APSS clock driver probes, it attempts to reconfigure the already
>> running PLLs. As part of the reconfiguration sequence, the PLL output is
>> disabled and the PLL is placed into standby before being re-enabled.
>> Since the CPUs are actively clocked from these PLLs, removing the clock
>> during this window causes the system to hang.
>>
>> Avoid reconfiguring PLLs that are already enabled and return early,
>> similar to clk_trion_pll_configure().
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 60173b076cc5..3641b2da92cd 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>>   void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>   			     const struct alpha_pll_config *config)
>>   {
>> +	/* Check if PLL is already enabled */
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return;
> Please add a debug print to match the other similar calls

Ack. I see in some places, debug prints are not available. Let me add 
that as a separate patch to make it consistent throughout the driver.

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
