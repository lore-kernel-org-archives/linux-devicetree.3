Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1232FD69E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258678; cv=none; b=b0GU8OW7NKbmFgmHz/ehL8iiok2mdmi9Ut/UeoS0AfFz4Ab15JKL7xU6PIZHH/GtVsRRnTQoKvO2iBEy8AwZUNbA4Ygr7q+CuJsAmfg7k630BgztzTHaCYuA9ygKJQqH8YeBXFGb3fGHBAgY6pC/iSWY6dXvi3gm2gVY8NzmxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258678; c=relaxed/simple;
	bh=kNwdYXQxhSnCBMo14LjoO5s99k2b7eHUDeXaniwjW0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQIg8mjAvxfaIWc6c3A2Qr0fgXPE7aLdIZs0d2+M8VJa1AhFLM/tEmrIgx/N9+3zOT4CJ4Nxx0ANKhnIMkm2XVPqJGhhiCnmRdk6+rjU9WqJWwmPh8NHvfBrvMHi2JE++G+YaY1dQTdqe4zvW1usPR+Mdxw7Vlci3onEtmIJlbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Udpn1XyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTY5Z+OA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Udpn1XyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTY5Z+OA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcs32141616
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNBYVEL4VD2Rb1PjIgbFv4Nat0n5GM6fK73Kzf1E+Do=; b=Udpn1XyE8KMUv4dy
	ua7EUwZ7of4nqHKtJLWxgXXho3GiVuCPw6JUwr4R6BF7VCyyyZyfVc+ZChbBGYZP
	9B6NnIycJaXUHWXgEFdZGcOGLU5+t1DrE6QYsT2UeeagN/WctBsDCV/OyDfKlfV7
	qg3OdCmFzTzxC7YUTs/gz3MDnAzqyQuRtoNdyE2fe/+24kXaQRaN3wlHOK6L7m6R
	6lcy6EQBqrtsWqSc1wf8i/bxakgynqKJWqfHHpvkS5QCg7L0RjTHuZdfeidLhOVv
	VtRIQD60r92PP9CkdqFC8mzUwyHkBLSOEIZVr9NbIkfq0ySOsDrsxwqY3v9a7L+s
	655Lvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fssv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:31:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1937555a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258675; x=1788863475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNBYVEL4VD2Rb1PjIgbFv4Nat0n5GM6fK73Kzf1E+Do=;
        b=PTY5Z+OAcwVuf3o6nugZniuDC9kHeVs7225/VBJLY8H5bfGwvlCtlEoVUtZFwsmylo
         fMBuhDJC0nYnEBXP8aQly026Py+QbGoUxYo51du6MxyX1JlUbX6wZjVYq92AaW/RDie2
         HoYyM78FwUSSLacengLe5o2VEMGmUTUnv3ACwfR8EusR3iUVA5D7dpGuqcuu6zY+oeBQ
         0N0CuxMRTuClA+0bR9SdeXmnF+MGkOID2SoYayrfajasTzP8rNW4Cumq5o3Qc1AmeDWg
         3oroKO4SK55Hkm0r5WZE3Wg8NVL9OoxmaloJA7SkD4W4l7Mi4pbxw1WEPnlGnwQDrm1X
         qZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258675; x=1788863475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNBYVEL4VD2Rb1PjIgbFv4Nat0n5GM6fK73Kzf1E+Do=;
        b=UtSYG1VnNOm6CXhjkz/BZ68Osld84Z7nF+NIhduQqSPpE2O2Xufb6RV1eFW0WdUN/Y
         E3jAk+9WibcXLBznj/8lfJRxEPOHfaOZO1+FUglP1Z1h6aT5NY7GQazIytPNocB9+Mvz
         Apws381BI2Yy622e6d7c7JZ/a3vmNgxjzXXXF9VXNr/U2dMIFwJHoXlGss1KeYRt0+Tm
         g0Y56Wo58kByR4OIj6kUcThZG5YhEWz0423dvR2qsLovsBhIk/uWUb+3G0IJ/dSSA7vc
         qT5UwGNt2RX60Psmrd4QUmOHJLuICZPcdi/G4ETmxHc21g7Hvb2F0OVB6Wz79JeCFZbo
         Fgcw==
X-Forwarded-Encrypted: i=1; AKwUvBx4mu0PRDVXpx9LHYjk/SYUZzSmmrbux2glhCJ85xNVaXUONiyOaMjr15YRi+0ghYe1bBYh7JcY01ym@vger.kernel.org
X-Gm-Message-State: AFuF++kHZDi8X+grjhlxmVEvTy7MFoc4/hngz6EWOsBd2D9C/z3I3bFt
	EVo+qw1YKAX37LiYWojtXBcgLmzsv1Ejwbj2fZcWe5lqPwuQyFpj1T46msS0X+s9t+c44zOGsTx
	qu1qj5ZbP5PXumfU87jz1ZyRm7Xt7iuXCpQMd9tsC5ypulbddnHMuuhDSb8fI6S0M
X-Gm-Gg: AYBFou3rKGQmpf75vSOJAGmi6TsmPB9Lt+EtalMs+y7MImJePeoGgLrvnbO6qALjZZh
	eBvwDODFhEgUHA60r/EXlOTnwd3Jihq6IxFkLYOq+kRSlCDPRDH2VPC/x27PAfRqPfuVAD8XVCa
	bD62I9VoIbKGu7PRf+6Ds9JTKsvbG6Hi2BL9EvbJwZvdjZy3x6EXmXdpg5Y1XZfRsA2hmK0dheN
	Cvkh8rk4sAY69a6OTk+1W2Ib4CzeBrijpvtEuPGbKnupxAQ7I+pLbdlGjRsACwip1dxjr41QTku
	+pe1iwr8s67n/rfKHCiu+Z+5jm8tqlwvsnogKJ9YPOEs8oNnNXyUQucr0N/wmBGIrbznBw/RhoG
	QWxOCn6/C4f4RB2FNR9nnbakxRNH+j8G9xMXug8osJ8ft6B2dSOkolBHH
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr26125892a91.10.1788258674557;
        Tue, 01 Sep 2026 03:31:14 -0700 (PDT)
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr26125813a91.10.1788258674024;
        Tue, 01 Sep 2026 03:31:14 -0700 (PDT)
Received: from [10.110.34.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40964900eec.29.2026.09.01.03.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:31:13 -0700 (PDT)
Message-ID: <40156974-6637-49b7-8629-11e7d0d4e55d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:31:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] soc: qcom: crypto_virt: add support for create,
 prepare and import keys
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-4-linlin.zhang@oss.qualcomm.com>
 <4594e3db-a8e3-4f8d-95c2-a4edcbc8ca7c@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <4594e3db-a8e3-4f8d-95c2-a4edcbc8ca7c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YwnNDbilGsW1yvZJC7qiab1q_xeDT5I1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXwPVV8XUhwepn
 T40PHnC2w+d8lz8EmoYdN9hHExaqgYDRcbgxqx8lsZK1oMNrBCPxEqd5y0KFrwlL+z/Xywodc8i
 3i7TzyhaA92ve5KRRB2NakIlyD+Px4U=
X-Proofpoint-ORIG-GUID: YwnNDbilGsW1yvZJC7qiab1q_xeDT5I1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX67mmkNuhNAQw
 r5s4zijhd12wGHREOwPAxoXUPcufOYPg8qNpS8xd1gC92kRAicciB4ArtLWOmxVQGjGx/3tE5Lf
 ZXIUNH445lL8c7HFlPI3vx5ql1WZkIYBv+6v5e/o03lo9IcZ8GZ6EJtQ8td/gyuV3lZlrmYWnnt
 7mziaSyjBjKBeYNVFwiqCT2cvWdt4svYzhOHuqJ4UACvgZ2RB4vPzeODKC8KsW9BBLci/Kn4Rig
 DAcYv4KsuNsn2ZjStRE02ZtJTYk417URTjbnHPbsLnofaH6JPV1fBxKfboim2nMlTUQJ+JNP4Rq
 Ytc68mMoRUbhD8q1O4AcPrqKELMH1U43QO20N/pAXnAmoGNzxmD/xWqP9f7Scvk4h138JXlRGlO
 +wH3wjDz/k/9E3+CavSrk0hTn1Kq0FtWdA7ZwziJjimLbyXaK+F1PWrQB2bKTOjfPTuIixIn1F4
 XgR81JiAzyWkzo5duSA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a973 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2tBp2Vdcr-mqUi0jtlkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091



On 8/31/2026 2:58 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 18:07, Linlin Zhang wrote:
>> +static void crypto_virt_remove(struct platform_device *pdev)
>> +{
>> +	virtblk_set_crypto_ops(NULL);
>> +}
>> +
>> +static const struct of_device_id crypto_virt_of_match[] = {
>> +	{ .compatible = "qcom,crypto-virt" },
> 
> Undocumented ABI, also not really allowed. We don't take bindings for
> drivers.
> 

The dt-binding document is included in another patch in this series.
The concern about introducing a DT binding for a software-only driver.
The underlying problem I am trying to solve is how to communicate the
wrapped-key size to the guest.

Because the guest has no access to the ICE hardware, it cannot get
the key size by reading the ICE hardware directly. In the other hand,
the wrapped key size may vary across ICE versions, it's infeasible
to have a fixed wrapped key size in the code. Additionally, wrapped
key size is vendor-specific, it's nor proper to pass it via virtio.

As an experiment, I used a DT property to set this wrapped key and
wanted to get feedback on whether this is a reasonable approach.

Is there a preferred mechanism for handling this kind of vendor-specific
configuration, or are there similar examples elsewhere in the kernel
that I should follow?

>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, crypto_virt_of_match);
>> +
>> +static struct platform_driver crypto_virt_driver = {
>> +	.probe = crypto_virt_probe,
>> +	.remove = crypto_virt_remove,
>> +	.driver = {
>> +		.name = "crypto_virt",
>> +		.of_match_table = crypto_virt_of_match,
>> +	},
>> +};
>> +
>> +static int __init crypto_virt_init(void)
>> +{
>> +	return platform_driver_register(&crypto_virt_driver);
>> +}
>>  module_init(crypto_virt_init);
>>  
>>  #if IS_MODULE(CONFIG_QCOM_CRYPTO_VIRT)
>>  static void __exit crypto_virt_exit(void)
>>  {
>> -	virtblk_set_crypto_ops(NULL);
>> +	platform_driver_unregister(&crypto_virt_driver);
> 
> You just added this line, so previous code was simply wrong?
No. In previous patch, virtblk_set_crypto_ops is called in
crypto_virt_init and crypto_virt_exit. This patch moves the caller
to the driver probe and remove APIs.

> 
> Please read submitting patches doc - you need to organize your work in
> proper commits.

The series adds inline encryption support to virtio-blk as a whole. This
patch implements the wrapped-key handling portion of that support
(generation, preparation, and import), so I included it in the same series.

However, I understand your concern about commit organization. If you think
the DT-based instantiation mechanism should be handled separately, I can
restructure the series accordingly.

In addition, Eric suggested implementing blk_crypto_ll_ops directly in
virtio-blk. If that proposal is accepted upstream, this driver would
likely become unnecessary, as key generation, preparation, import,
programming, and eviction could all be implemented as part of the
virtio-blk blk_crypto_ll_ops backend.

> 
> Best regards,
> Krzysztof

