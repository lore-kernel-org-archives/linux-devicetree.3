Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB238E8B1
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336965; cv=none; b=H8UOjQhOFEwkioA/iDB9oQqUe7PuwULJTOm8b00LX9V7iJoohGd45C03KGTHQ5T47ooFV29GFI5cX3YU9hS7YRQSXiZj1dnm6lNi0rI5AgRV48wGPpcTmSTowKuCDwrxN7/bxq3iOL6iqliTMrQLwrqDu7K0QInYe8AUhr7gM0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336965; c=relaxed/simple;
	bh=4EBZop6hmCh7YwO3br9UVC99j3KelVK6bWu2MtH0dl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTi2HFhGKm1W70TsRUZc9CQl1ZizMNu0+03xezK+X2utyYZppdi3X/8MkdlH1mOi/iJ1sYk4ymiSwzzpEZB9g4bII7p+U+31jAxRs7x5o2t4+U1BScp/F4qdEdnQpy1lNkshRKZZsPtseWC85UNqL7qQNN6Hcq9gDMqWX6bZG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBwQJ6MS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXZekVQ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBwQJ6MS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXZekVQ4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VY3i143092
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3KCcdaipiJJVwZrTfhujb25/F7NiV3SwgGKSDqyCCA=; b=bBwQJ6MSL5Mb6gxU
	ryR5PqtebGke7nEoapdkEpgcowNEnF63a4JJGlN5AYC+W4NV0Im8Q2EwrTABm2jf
	rnyOCNhTYgfTkRzOwHpW+duLEa8NPniwmzsU68RJbnauqgD1rTQKYYt0kxHPR5yH
	WtAYJ4RJFKtjUuWKcpPgVcYT28uXDBzr78n3mpNErJOE2pGtHOwreHGP8UDprrOC
	gwMXRAkmWnCNNJs9HIAMh90IBtYYyL8JIEiPZb7tqT5rmmGzqwoTZBxl5V342EKq
	aBgSugNSdxA+cDnK5u+h/QYO1B23aJz67GnexysPc/yRHghsQI6At1pCr9tH+VMN
	//+gmg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397ax00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:15:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1068384a91.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788336957; x=1788941757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3KCcdaipiJJVwZrTfhujb25/F7NiV3SwgGKSDqyCCA=;
        b=fXZekVQ4lwnmxOZKGpNRKMpVosdMiTT4BKGz+STcWHAWpSoZsIA7F9rPnVCwOtS757
         ay8NkfcagifacAbpkfKzQ/fOTqFAEkpDFM28oEEbJR7H72iX6lB9vKL7g8gGxTe/MK1Y
         YSm8j8kIGJg1SKGPZ5cep84ZmlOcUOxEg8bfhpS1l6xoseRcepWTlT4WP9mqE0WhQew5
         EaNkrqCyMZC91bv0K1XgzUnHHfosfgMWRi/UbkXnupJvYwH5fpr3MOfNpzvPCgjwsmyf
         fDNxL+CmQnigtCM32MRJfR9TrTEBmyJPnrg980Mm1JiuGwvff9ObqYkcH7VQXe3hTFWs
         VKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336957; x=1788941757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3KCcdaipiJJVwZrTfhujb25/F7NiV3SwgGKSDqyCCA=;
        b=C8s+0bVg/ysKY/T1qSp1/iYEjGPD90WtD355xOkUOp3s15m/GDDJWJDmBT0ZzLF5mu
         S2D+IOvurM0voDQN4X3XthzbjgtCUEAxF9H6dTUwZNPb0cgAdgBzVw9Az2AkDUHZ5bM6
         nHYbrTSw0MeVn2MpGPCUH9qUW6SauLRTa8Gtrs3Q2RHeM9qWc0+lc+Q3X4w1GGPVFUdv
         xUg2CH+1LZ78+zGbNw2sW/GIWR80HX8CI4OVBtCOsPafIaxP2ClfYGaVuNXM3pq7GVHn
         qknPAPLNk+vFUpSG9PHKQzThVnvXvZGmSrCipv/cHcwszxejZs80fzuX31JvRrUAzX9j
         MHkA==
X-Forwarded-Encrypted: i=1; AKwUvBzNgO+LPerod0bie51svL7ULTjR6qyi5fnIxHnFZ8bhTWnGdMCbj7jGXICER/eVU6w3xhb/PqLkwyNl@vger.kernel.org
X-Gm-Message-State: AFuF++nYNg8OtcdGPi3YmsfgNFFi83YBmW8cJ6HVUrMVlnlDapi4Erph
	gf3jrgokKqMv5iHyOe4mUFt7W8+oExFM+BPHaP3N0O9OeHx+DUceDIFBouUYnsBZheVG40aB2Le
	kw/pONKyN6G/k7nugiOPkFzTKfuatkYjAOnRUEwnmiC6n+8PbN6nbWnoGEffIU4FB
X-Gm-Gg: AYBFou2TWsr26XFA4iGBhx+YYDCX/avVnNrn+W7duq7ZdjIo6KmkF7+1hk2xwGD7NMu
	8c9TPkZrlLQ/q49x4pLML1lszDnRCcaTnOcZwBOG/8CPfxu3SYnB6dkl8xoQDkYxHYrgrabWxI0
	WbpRrwS15+XumBmYJbNQCzvYKI10nxYsoAtcjk6KV1VA4yusFtHsDk+n2VVOBVtougyCcwU0j6X
	MXu+vOs6Man7/qPbpebghAWi5l76fg4uY/wdY0V3qLys3Jo8IGU+gGDAKLA/w7HexoYOOm90NF2
	nCCKqytTw1EYScgx8McpnWwhyhiQEYv3l1QPHCxir5An/STP9UFssegRr81tNz+663vpP5u+Xo1
	rp0NGyQKdi5H5QKu6Famy2bolUIpTHmQ9UVzMN94AHR8pORVM6GmhcZDX
X-Received: by 2002:a17:90b:4e8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39aee0840d5mr4788051a91.13.1788336956897;
        Wed, 02 Sep 2026 01:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39aee0840d5mr4787972a91.13.1788336956374;
        Wed, 02 Sep 2026 01:15:56 -0700 (PDT)
Received: from [10.110.50.50] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b78e5dsm3906650eec.19.2026.09.02.01.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:15:55 -0700 (PDT)
Message-ID: <f1b6293a-f2ce-46c6-94c4-dea30d65cb6a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:15:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] FBE virtualization: inline encryption for
 virtio-blk guests
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, axboe@kernel.dk, mst@redhat.com,
        jasowangio@gmail.com, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-block@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        gaurav.kashyap@oss.qualcomm.com, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bvanassche@acm.org, alim.akhtar@samsung.com,
        avri.altman@sandisk.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827184219.GB2137493@google.com>
 <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
 <20260831210759.GE86114@quark>
 <ca838905-f0f8-4f0a-96aa-2bc05ab6c0a7@oss.qualcomm.com>
 <d7ce6c39-d9c0-4746-ba18-1c37a929819b@oss.qualcomm.com>
 <20260901194447.GE527638@fedora>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260901194447.GE527638@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfX0bI9iI7osiA5
 bPY8SdqiEJiM4+ohHEIyg0hHQsfMlGzZ9ZNjSF170sCr1Qu0DP+uI3m1F61HpFUY3eAsRRAwgY/
 5whf7c94y2Uv0frWGP/bKtI0iy8jFbFxdrUarTne6yq0hlamDV4r7qRBLmN0zD9z7r1HJ6Vki+J
 wVqHqIX5Cp2BPBe9uc0tbNoN07Bas9TKF5QFcNlKXL2Euu32DGA1dmh4iAAj76gRJ/KCsDJ2s31
 oSQAar2t8GPsjwUlqzfXhJxYyTv6Y4QQPPpA6yf80qY5HFhDh+bER1/ACXUiU+ZivDVtNtRq412
 8tnDqN4xo5vhNgknet4t4yxvPTVFgi972WM8f6L7MSzd5bk4jkGwNJHz74X1n3SIT6ZFSxrXAxR
 NOIFIs5CfNkN4qVQFknpC9kvQP2hfQRIvHaRxwSjtRrTqtDseDjyL80RP8rfL2upidvXoGNGulS
 Q+mShO6JoGziGLmHcjg==
X-Proofpoint-GUID: itf0hpp9CbugmWH15XVtwm3eyfS0qhHv
X-Proofpoint-ORIG-GUID: itf0hpp9CbugmWH15XVtwm3eyfS0qhHv
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97db3e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7YQJ322hvLlbXND3IkkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfX2Hxvh076iK2Z
 KFngBd5ZU1VKMzrvJ+EUziG0U5sUmh+fucAkD2Dgp1zII7O7e24k/DHzimLzPQ0NX95vRH3pHK5
 9V1W0l8l/eagi4cL+DpTs6au4eSGZdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020072



On 9/2/2026 3:44 AM, Stefan Hajnoczi wrote:
> On Tue, Sep 01, 2026 at 04:45:19PM +0800, Linlin Zhang wrote:
>>
>>
>> On 9/1/2026 4:22 PM, Linlin Zhang wrote:
>>>
>>>
>>> On 9/1/2026 5:07 AM, Eric Biggers wrote:
>>>> On Fri, Aug 28, 2026 at 11:37:57PM +0800, Linlin Zhang wrote:
>>>>> Thanks for your comments!
>>>>>
>>>>> Not making virtio-blk itself support key programming and eviction is
>>>>> something done deliberately. Based on that HW-wrapped key management
>>>>> operations are also handled in the out-of-band path.
>>>>>
>>>>> There are bellow 2 approaches I investigated to let virtio-blk programming
>>>>> the key.
>>>>>
>>>>>   1. virtio_blk implements blk_crypto_ll_ops interfaces, including program
>>>>>      key and evict key interfaces.(Same to 'the virtio-blk interface standardized
>>>>>      blk_crypto_ll_ops requests' mentioned by Stefan in the virtio SPEC thread)
>>>>>
>>>>>      The guest's block crypto profile manages the keyslot in virtual slot
>>>>>      format in this scenario.
>>>>>
>>>>>       - block crypto key and virt_slot index it passed to the hypervisor's
>>>>>        (EL2) device emulation (QEMU, using QEMU in the following) which
>>>>>        runs in userspace of the host. Besides of transferring the virtual
>>>>>        slot to the physical slot, a programming block crypto key UAPI need
>>>>>        be added. Follow current blk-crypto design, it may be like
>>>>>        BLKCRYPTOGENERATEKEY. I thought this results in a security risk that
>>>>>        allows userspace process a key into a key slot.
>>>>>
>>>>>      - For key eviction, it's similar to above key programming handling, also
>>>>>        need a key eviction in blk IOCTLs, but leads to the security risk
>>>>>        that allow userspace client to evict a key in a key slot.
>>>>>
>>>>>     virt_slot, DUN and DUSize is appended to virtblk request during crypto
>>>>>     I/O.
>>>>>
>>>>>   2. virtio_blk implements blk_crypto_ll_ops interfaces, excluding program
>>>>>      key and evict key interfaces.
>>>>>
>>>>>      The guest's block crypto profile doesn't manage keyslot for the guest,
>>>>>      the host's block crypto profile manages keyslot for both the guest and
>>>>>      the host. The trigger of key programming operation is moved from the
>>>>>      guest to the host.
>>>>>
>>>>>        - The whole block crypto key (key size, key bytes, blk_crypto_config)
>>>>>          and DUN are appended to the virtblk request during IO, a little
>>>>>          high payload.
>>>>>
>>>>>          The backend parses the crypto message in the virtio queue and
>>>>>          construct a block crypto key and DUN for the bio_crypto_ctx
>>>>>          set to the BIO. So that the IO flow in the host can program
>>>>>          the key. 
>>>>>
>>>>>          The question is that the blk-crypto-profile distinguishs the
>>>>>          block crypto key via the key's address. But the host has
>>>>>          different key addresses for the programming and eviction key
>>>>>          operations of the same block crypto key from GVM, because the
>>>>>          key is re-constructed in the host for the key program and
>>>>>          eviction operations. 
>>>>>
>>>>>          To fix it, the approach I thought is maintaining a new key
>>>>>          hash table in the backend, and comparing the block crypto key
>>>>>          content and DUN parsed from virtio queue with that in the key
>>>>>          hash table. 
>>>>>          My major concern is that this need keep the keys synchronization
>>>>>          b/w this new hash table and the blk-crypto-profile's hash table
>>>>>          carefully, avoiding that key is still present in the
>>>>>          blk-crypto-profile's hash table, but removed in backend hash
>>>>>          table. Another point is that the whole block crypto key and
>>>>>          DUN are appended into virtio block request per crypto I/O.
>>>>>
>>>>>        - For key eviction, adding a key eviction in blk IOCTLs allows
>>>>>          userspace client to evict a key in a key slot. I thought this
>>>>>          is a security concern.
>>>>>
>>>>>
>>>>>      This option doesn't need map virt_slot to physical one.
>>>>>
>>>>>
>>>>> Taking all the above into account, I made a compromise to implement
>>>>> blk_crypto_ll_ops interfaces in a out-of-band path, which lets the virtio
>>>>> blk only need focus on the data path. I agree that it is complex than
>>>>> the second option mentioned in the above, but small payload (only
>>>>> virt_slot, DUN, DUSize) in the virtio block request and no security
>>>>> risk of key eviction from userspace.
>>>>>
>>>>>
>>>>> I would like to hear your thoughts about the above and am appreciated
>>>>> if you could share your insights about the design of inline
>>>>> encryption in virtio block.
>>>>
>>>> Well, the way it should work is that each virtio-blk device should have
>>>> its own set of *virtual* keyslots on the host side.  From the guest's
>>>> perspective it would act very similarly to UFS / eMMC inline encryption,
>>>> and it would be easy to integrate into the existing stack.
>>>>
>>>> Then to process encrypted I/O, the host would use the keyslot number in
>>>> the I/O to look up the blk_crypto_key it previously saved, and issue I/O
>>>> using that key (using bio_crypt_set_ctx()).  The existing keyslot
>>>> management logic in the block layer would allocate or wait for a
>>>> physical keyslot as needed, so it should just work.
>>>>
>>>> Eviction would similarly be passed through to blk_crypto_evict_key().
>>>>
>>>> Note that with this design, there would be no static partitioning of the
>>>> physical keyslots.  The host would just allocate and release them as
>>>> needed, similar to memory allocation.  The total number of virtual
>>>> keyslots could be greater than the number of physical keyslots.
>>>>
>>>> This design would also work with hardware-wrapped keys.
>>>>
>>>> The hardest part is still the UAPIs for the VMM to do what it needs to
>>>> do (assuming that it even needs to support physical inline encryption
>>>> hardware at all, and not simply use the AES acceleration on the CPU),
>>>> but that is the case with any of the proposals.
>>>>
>>>> - Eric
>>>
>>> Thanks for your insights and clarification.
>>>
>>> This is a very clear architecture for virtio-blk inline encryption support
>>> and is quite similar to what I referred to as approach 1, with a few notable
>>> differences:
>>>
>>>   - The host maintains a set of virtual keyslots per virtio-blk device.
>>>   - Physical keyslots are not statically partitioned.
>>>   - The virtual-to-physical slot mapping is managed as part of the virtio-blk
>>>     device implementation rather than being tied to a VM-wide slot table.
>>>
>>> With this design, I believe there would be two VM exits associated with
>>> encrypted I/O:
>>>   1. Key programming
>>>      Before encrypted I/O can be submitted, the guest needs to program a key
>>>      into a virtual keyslot:
>>>      
>>>      Guest virtio-blk driver
>>>          -> VM exit
>>>          -> virtio-blk backend (e.g. QEMU)
>>>          -> ioctl
>>>          -> host virtio-blk proxy driver
>>>             (stores the blk_crypto_key in a virtual keyslot)
>>>
>>>   2. Encrypted I/O submission
>>>      The I/O request carries the virtual keyslot number and DUN:
>>>
>>>      Guest virtio-blk driver
>>>         -> VM exit
>>>         -> virtio-blk backend (e.g. QEMU)
>>>         -> ioctl
>>>         -> host virtio-blk proxy driver
>>>            (looks up the blk_crypto_key associated with the virtual keyslot
>>>             and submits I/O using bio_crypt_set_ctx())
>>
>> Supplementation.
>> This may be a potential security concern. The host virtio-blk proxy driver exposes
>> API for key programming, the input parameters are blk_crypto key and virtual
>> slot. If a malicious program replace the key in a specific virtual slot between
>> key program call and I/O submission via this API, the data would be encrypted
>> by the unintentional key.
> 
> If the virtual key slots in the uapi are per file descriptor rather than
> per inode, then other programs cannot interfere with each other's
> virtual key slots. Each program gets its own virtual key space when it
> opens a file descriptor. Sharing is only possible by inheriting or
> passing a file descriptor to another process and that's good for
> security.
> 

Thanks for your advice!
That sounds a good way. I'll check if this mechanism can be used in the above
design properly.

> Stefan

