Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540C4AA014
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048552; cv=none; b=Q6xV87JLASrINzy8GZKhB4/4at5zH06vq1hi0BgxZN6BU0MkrsPE2oOGew/GnlE8K8azieNzxP0BZI1A+JP3Rvo3BW7YAUY+gX0mC7BsAUov8u4HeAsdNynLRwHv0QZxZkCTkpus+pALNylcKelqcheU4R4lw/TcdJo3pT92L3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048552; c=relaxed/simple;
	bh=/wSh3zJmkx6TtnnckwzhBMdBXjxjl8xQdGNCsjICl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEwOtx+jmtQJUsnpQERcphEILAw9MMW8JIwjvH06lAAsXvgqNdfwv5HjD169tq8P/lC+PihWb0DVGQwfKuv5ijv8VpAtBI2bu6oRnZhzxwmYpvvktbTkw+KZcXs0D1I9twulRxmM0hEp3fuzatPsTqrPHhMBOmMZbcfnxEOkCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2ruZgF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck8rdLfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2ruZgF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck8rdLfu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Og2w1707295
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=; b=K2ruZgF8J3jtYrUE
	17ObGhOSjwoqNxY0Yc2lqTcT/po7C09qq2p71Ngob6oZfVfXv8foF/tYbeJCwV66
	8ktL1L2KQ4Fy8NRbBjRgVVESMl/4yqr77X8EKp5x2oRt7/c5abPbmTRfo1fkUQFx
	ZYVp76OR4KP4WjzcRWLrKssiKjT8+n2YROgH5NU3Dt/MAWgr4agHSPUGf50RFs38
	uEr2aY1vQmaaukYknt6OqNeW2ivQMeqMV7Eq+He61Q+gYL0IvqrPv1FSViyu7JRR
	mBfv4QlZlKUimDrjzpcFjLu7zQYPLSe8vRv93OV3f0+rXue3pLDNqCTMW/mOdIKQ
	R+6Pkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54s6n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso1944135a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048534; x=1792653334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=Ck8rdLfuQmvBCBqr5jy+9Uz4eoDWwrAAsRYwuCykHSZxgeFauis4BmLxZu1iq+VCRr
         n5mVKJ0mHO47I5KdAOfCHGZRYcm1AxH1cXYq2ioGU27lyG1DNkW3NIjpTsRIHeJD4l6U
         48UtPrgJTo0U92QWVv7w3oyaAKhtTZAiKi+lx5RRToE8KmjCB8x2gJGbe1RDtlRSkhx3
         5nT51stlY+NfAaedyRHrV4JJ/GH/aTUGZDjLDhyPr6RtLFEIUKk3KS/rFKs03+Wa6Db+
         r4dr87lo92ys/oJPCwRi53VaAu9Nz5OHFwJuiF/c2QRH+GvqOIfIul7P6g9499xhjIq6
         DYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048534; x=1792653334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=sKKf2o1CSB7VYO41V2wEFhl7AOiZnkrKS2fUSWtlnAY6Ek0pvfRc0zsfMq/Jq9/U8i
         fVJqnq0+BW7RRx2BNCSTNhonNFO065F0/myS78Fvz/J/n9xYNHDJBZyzAoeX/QR6rhdp
         1fyq7hl9Dm9o3D1VcfmWPOacxDprKHtHN1wlwLdfNU0d2shCtRrmc+gpffNqwuluyU1S
         6HIGWEyuGORxhnm6vhLqTrzhSd/i0VhCGQNOWmUCR4OYpGrcsFqJxIaJgxM2E9R7YV1k
         kpdqTMwnSo7VMxbKurHodkv4gJ/1kuyjoKAJdTiPnqUZ7rwA4kdiqE6+NlOlCPfeJg1h
         SXQw==
X-Forwarded-Encrypted: i=1; AKwUvBybv/i32lgEdGGtkbZQyoARPfpnGBYkw2r4iRHcPZmUXPThoc0zw6l4+w0c+lDCZbl+hiT1ojJG8Uet@vger.kernel.org
X-Gm-Message-State: AFq9FYLTMfh6zHpp7UNHYyukNIkW1W87YMHCsv96d63undFJU6GSUEX6
	d4Ze0X+lo7yn2+FmYyjKqJ1sgTaEdvK4fGzrMawj0gUGqVt/kJ6MuTVIVVZDCPj6sAPGy3Flq1Z
	KRv3ns97D43558czq3WrLziU01lQai0IGhMZA5F5HrkN1/g1CdaZ7OK2UM9mSFhwl
X-Gm-Gg: AYBFou1k7Ze5pkfO0014dT1YHgXKJVtTEHg5U2LYTNOvYKrRl8Y6jRorWI8J5fYbfnd
	sMxv65Xdi6ia1walmYC3TmtbTXEZ7l9+6bP8Qfu86e58ZHrVliFLtGhBFRREksk+1SRLpkpOxU3
	S5kisg246ZspiQpkTrFURe5Supm9O692L5KdyiT+PmfvEM5aPqKB4vGKCh9KWYh5iU3LWo7QO8P
	JJTx6CtvO3QphZxjhl0Pw3kyiX6+O6lwF30rzrRO4JMDF/4Jw5gCXKiZnkglp1PMuVlTt3JBW/O
	j+wd7CAy2vOELIvGSRLDKYzYsZlpkdFSLpErykGSRqBLMQOnyf4iiA/pjTd8VZ7shiN2jnY4fMR
	LN1KqaG6lhQMIdej+VzTzRnxqxXU=
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430163a91.5.1792048534149;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430141a91.5.1792048533687;
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Message-ID: <a944b2e1-3985-452a-bcc6-8b16969a7392@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad07d97 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PM9MLdjoRCq9o7e-zGMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX+l0fPmWqSNLG
 AQzqWElG02cNdK5FK49tNtxM/l39k8isiw3C9d7xcdYexUkm1tiISQbu2XbczzExTR0cMyLr3w+
 bikMSfdZX37d86futpMzRNnbfH0UvgmeAE9XxVNea96cvU3UuGUf4WJH/yX/7rfasRkrexP+ujZ
 j0b5XMHv0seppdzUdCnYBNYLvFqX5M64j3iLVJMnGsGT+RrKmFsldRhFSN27bqTW3CO6+5VWjpd
 v65qSCt4L/B1r0R3mJiFAxZKdMIW9zsFTGNVsByBpQLGCGAMRhl8GmlcVo84OQVS3OVHkgrozXg
 i3gV7RsglFtlderMTnWNhSKX5QBqYvlafFgVvUMsc7cL+ZompPi4YL2NhqCUTR5HZOYhK/DrqHa
 7k9qym9zPUUh4FvFdIEBASQbtu4gqSg7iFpHH9H+V5sHW9q8bfE1wuIFFdZhSN6FVDV/AAEFhwM
 G7LL8j0NqztOKapwCtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8r8HEwSftzPN
 IBu8Ah6Fjw/kJhyKUcjlt50vGeDYvNOE8c5FlevFPuAz/WGKpHxAJiM9mHsK8Yq01lIHxJoaUzD
 tJHtUodVlGxvPgiTdJVqblY4nxCviqY=
X-Proofpoint-GUID: cpwXRa8FWn-vYA1ddjnvwBE6PjoAyJV1
X-Proofpoint-ORIG-GUID: cpwXRa8FWn-vYA1ddjnvwBE6PjoAyJV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:55 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
>> +  clock-output-names:
>> +    maxItems: 1
> 
> This should be deferred to the driver

Sure.

> 
>> +
>> +  pinctrl-0:
>> +    description: Pin configuration for the GP_MN output in the active state.
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: active
> 
> I think these 2 are always allowed/defined

Sure, will remove them.

>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Likewise, we could simply set_rate on the GCC clock which is the
> parent of this one, via something like CLK_SET_RATE_PARENT


The GCC clock could be either at 19.2MHz, 9.6MHz, 6.4MHz, or
4.8MHz(consumer/customer use case dependent) and the output clock at
GP_MND can be a range of frequencies(which are not fixed).

    assigned-clock-rates
            |
            v
     bi_tcxo (19.2 MHz)
            |
            v
          CDIV (1, 2, 3, 4)
            |
            |
            v
      gcc_pdm_xo4_clk (CBC)
            |
 	    +----> 19.2 MHz
            +----> 9.6  MHz
            +----> 6.4  MHz
            +----> 4.8  MHz
            |
            v
         PDM GP_MND (Variable frequency range)

I missed one patch where I didn't add the CLK_SET_RATE_PARENT on the
gcc_pdm_xo4_clk and CDIV(additional) modelling.

-- 
Thanks,
Taniya Das

