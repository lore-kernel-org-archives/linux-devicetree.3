Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E933B635F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911902; cv=none; b=aQugrlc87YqVWyZYyAiXA20Q93kIIj7l7WRj9PMMvWVkFuhu8bQa8HaKoenCWK/aedK5jw9HbYrIzpcKvQONIZJQ6DQw58tZ+UMdIkdXjM23JGxi18LqP4HKMuEAtuQI76yEgPlVx+O7lkBIrCT5sAD80GDYqIQNcBF3+QEKYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911902; c=relaxed/simple;
	bh=Vmr+hFusuYAL3gRCxgWvVJ/q4PobECw1SQhrGuoxjwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRfsbyMzxbRatSQZbTElIlUIh6cA0hRot/e/qJp+JaofE/T6Wh1TzBVZD/6cl+WbJh2lGx6liBQ6w2VDR/16SO6wvtZFSlA4Innt1pEo9nLsh9OhZhkWgntHvb9wDVw+w52pBDN/m9ae9OGCHJh375sr3XuNBmkxtDWsadT5jNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k++ZXwGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5/EYgzx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k++ZXwGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5/EYgzx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrEM2274513
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=; b=k++ZXwGuExiMngbv
	5eCp4gwEWx17XykpFT6ox05ja+dLT1GGNO2FdEdgO5HCk8dpTmyLAlGWd0KSYCby
	q4+ErgVOsLdFvtFzgi8+aZefsVYdjHvLFvvebeyi3L6Qq6yU/bX0sNiR/ZrMdTjJ
	f3QWiGmOmMAQcUnp/4JsvypxEJ2UA25Er9m0y69WCteH+KxPFlCsrd8auwDLLVEF
	mXrEyzEj48AhsHIXa3QsmB2ZAc+QmYNP0l+dcBfOB3H5LA20juozrFrvYaChA3I3
	IwFAddWNOzNGHQIxyOz8UcfTyGa/sa9gfXAfFA1k+4S395vWcyEU8itHNtkhvSpH
	Ld08qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxvdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:44:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51780e3ca44so7973281cf.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911898; x=1781516698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=;
        b=X5/EYgzxnvyU4eMik4gUgcOprbxusNHy9Zc/fyqXEo5q4GqJc0mNwxIwTh+Iy9Tvzy
         p94n9BvJ/s8fFtic4SR0i2Hq5ve8j92LbIauS/pATk33uKjDSo/IaR7kmXeG2aHHK1yc
         tglHD7e8AWdjJ6V4iI98Sp1XdFNOrs/tCT0Z+96VyKwz3gSvzuluJ6Bm5BjVxjNytv2r
         jeyoDetfPH29/pEnSlNZZWIZNSkRgholUCkl1y4oo+WPygv8roPzY8Ao6iV8UtY48rP6
         ZqqJW5KUDfuJfzJXP0yzXDsoHLhpq6/LhQZV8dQ9giM12+X1bXHI0iHKn1kUdItDiqYO
         XSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911898; x=1781516698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Tzt3nk2yUkhDZipgo0L0eDdUW2ER5Qt+0SMe1w2hT4=;
        b=KMUsQpVrd04GdnIakPvqOO0JNNSCO/d3mEpjdMTxQ7RayNN0D1MZFygq/D6oXfVpYN
         B0vo9t+iqvZG8Bnpp1AOFBnwoU5bgv02Rp48G+j1EulCyKZ/ztXi1J4ApaGyX5fhSfex
         l9PMqAZPvOBD1G2XlrrOsuP76C1M0k2mxNcEBg5ZezDRsFZT75nSWTMjIu8z8blhv/SH
         vEyT4qgOC/UzSbj9Tk4UY3QMJCpw+KLg132BwVPrQ9cTJ0zj4qqlEghPTHHYPZjGP0U0
         1E903KN05oWUUDwd/AgPZRopNiX9lyGQYxy4UlpyzFrcdOOu8oSYDiwb0Vpis97DcF1x
         NMNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8n9AHw+Kz/Sm4Ud9iubUY6SXNzonnFAJ7Jk4nkYUpY93vsxQdQMhrqkifHg6uBXNDt2kIVWi1yKdUR@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrJMsnlzPLnTAbZ1vVskCer/ZcNaXdoL/Sm8GU9TPoUBE7otf
	zWaZmwkQAi//9mK2MNSBesQnl7GmYXOXvEMV9tv513IU+qY3Xd4mvesdsDx8SOiGS8m/UjVazM/
	wOj71O/NunOQODpTAdZ1UcBPdi1Bor6oSuJYA3U3ObVnKVsLFXAJS1HEJ1q0zE51k
X-Gm-Gg: Acq92OHkIY+68rd20r2uc7wpX8Ak7atjgcJ2eYn/98fVHGT4mb7TceIVZvu5tWkTHRn
	jMS6+X4MKWFQ0fe8UzgmxYRd09bZ//lGXi1SCTK5iMZG3jiLph6RjG81cTO3PeH6R1j/hSBl/Gp
	7RRc/afAS+PzozSduy5iyCBmkGKv0bTEo1NBOMeKc/M/zpcIw8HbGQm6qclsHLOfc04cb9D/7wG
	2wtZ/er9WrU3l/lXFZOkHdsgnNKFViVAYm9Q9WNtFqSa8+aUDZI5V5PzOghYNzdmAuRa+EFh+Qq
	8WA3JJjysPZjypDV11x210tr/lOCiy1hmcAPogcFO0T3u5ETPDyPH8gedx94JDS14U+Lsyd589B
	2Xu5kZuQgkt2I6upW2Vf3BaLdJzyKmjhx/aRIBdE/sglzr6iM3bNvBSNw
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr123731801cf.8.1780911898619;
        Mon, 08 Jun 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr123731671cf.8.1780911898263;
        Mon, 08 Jun 2026 02:44:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-691afe82416sm1478693a12.13.2026.06.08.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:44:57 -0700 (PDT)
Message-ID: <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:44:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a268f1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4c8ik4K-SmYL0_MpgcAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kOjUYy6yljqG8ct7cp_SPfXo6MkOvQE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MCBTYWx0ZWRfX+LMXpYLFLrlC
 WYzOnOSuFlol7dRF3NJJ5x2Z3pWOv2ryL1xM8URWiWe2SZO3qdo87EeeqWItXnbIsON2iU6iB2D
 bdKztBBigC/Nc84aafPtisdbUHf6H7oGLFnFuFmz4d+tts5yyN1VXBvn/83V/UGio1C+JS10A9a
 +z4DJlGAJFKFPCiArMAOdUDpmbfqrwVU0qjsQRmGlq7NmZ4P09E/R8sv1l+tjwF7TlAvKW/DyiK
 ON9kDAPn7aKyC0xXJD1d5YGTFxxoEBFECpqMASRvMY5cIshZei3f1mVyFpIks6dSe9H3JfpKmqU
 QzgWp76MqLv/RoJPcALXmbGSEgMwjqfyMZhTxLvMvf251aLrJ7l0Bz4h6Aq5NUaoNxNQoybAy4b
 auWmcfZuUieYl6Ax6q5oK1EeDl9iXceELrhFtrq3psUXozKju51iWGXAavgpWnNqjoY4c9e97Ar
 jWxh4dTNRlnPtcjnAeA==
X-Proofpoint-ORIG-GUID: kOjUYy6yljqG8ct7cp_SPfXo6MkOvQE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080090

On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
> On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
>> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
>>> Add DT entries to enable the PCIe controllers found in ipq5210.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---

[...]

>>> +
>>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>>> +			reset-names = "phy", "common";
>>> +
>>> +			#clock-cells = <0>;
>>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>>
>> Having a gcc_ prefix here smells fishy..
> 
> Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.

What is the name of the PHY's output in the clock plan? I would assume
it doesn't have gcc_, but it may end in _src..

Konrad
