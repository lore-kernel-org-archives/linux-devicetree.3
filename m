Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853880;
	b=WSKXW3bNrTwIaG2o2JOp4usf62q8r5OC0J1Rdt9+k1GYWBvfGk6yxMgCZqXZwEv97ien
	 mKRKYbp+zCWqzKdjh/9LXb17sEM8+wmL1a+XkxKN8ZTU+3P5UupqmT5ntTB9nZRL9GJyk
	 QaIuEbEK7fUt7U4y5gqfcIhjSpWoXQVdFEDczGGStyBpY1S2ZIt67q5SmD4BaYmFTCzzy
	 FaqBpVDFqN8AriiGWaWrEffnExQ/ejA92mQ3mV7Y74kkGW7GctfaRgUTf4pYcTo6ZGG+S
	 NTKAwjmrx6Bw6toyLAuOsT6PE8k8bIVRam4XWsBCFjISQrHd3kFgtZXKNbQEufOK+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
	b=Op8sD6IYsZcdnnY3atdLB+ok31av50c6rrjFR+EFH2XycRH44uwQeG/EAPmubvhdWOVd
	 X1Zz9sFHFzqtrnaYn+/Cb7HpGKc/JF7BTE3wuy9vKnexRRCE9uUwepLKRnhFtefzIzxse
	 KLUm8iGJZYuAZxyxdd/8aL7hITf1lIRgUXw7BbDjcRtxrQryr8fW/de6oxJsMWoM77n40
	 6zUpA3udHo3Pz/343iBCrNax2QKoSrnkMWE6W0uluu20C/BOk9WH83sM/s/pvC5cBG27I
	 scpNUW9iP/EitoW7BpsKeSftG6cgkFXCAwtILI8SwxQtFOMycnhtJzNOPEgN8mRpQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04B606A31E
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC04B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c45111bebso875474f8f.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853878; x=1793458678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=nMxrjfJNFph/Sn/t1gDc23RmnPkpjH+f+gr0HSGObz4xkS4q0QihM+B/1cDxlUhIc4
         sDnXXIVtwJjBhP1yY8aNpREl5r+B7A4jWr2NCudhe+0CNu17U9Gk6VfIx/grCZUKKtKc
         /dzpm80Vot/uFLoyRD6Jn9h8f2/vRSrUL9uPREc4Egg1f3vhEnSRZTxWYqVUlwJ2sv0H
         5LkZ1zS21msqH3aYZ8/ehsgHVCRF1e+PsododjaTmJrBRtBk836CgY4/Jym1DGWzVowO
         9AFPAoXjhH0iRMvv3u6TzGC2IERxaRuJTCl+zZF0NMjyleTjpdGU33dQzkTIHKFTNmy2
         OkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853878; x=1793458678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=bhpSFEhi6QHF5WRuBdu5WxHFeFP9UBFQTcuKKuazgQIxDWE19pAKJ0cs0tP/wkvfxu
         oOIEmQKsyyCFa1pJ6MGGgh+Ay2fCxX2dW8600LC3m8oMIR4wKEGqPneUlWMdCQSofdOF
         wcwaZwVUKZ2RuaTKyk6w0kHNn4pGT4Ng2JZy+3NsqX09/U8/tYSN48PVeWBd82soY4jg
         Iq6TUHw69QuFEY7h9CjKotBcCtRTB+lCuoKgQNcNiLygLCo21NIlrSk/b/lE4qyhvTut
         GiMJtKncGlN8qtGrmQT2Y2/A7rrdgLKWqKMWJ1dhoVcwbk1o30hHsbiugVLg1dC1gz9f
         9eAQ==
X-Forwarded-Encrypted: i=1; AKwUvByyJ2PXIi6p1UT/hB02MfXc/fhWbs/hnWRCUfHpJh/8mVsOMbUilaJk6/sniXcL62Kgj+8G0Pexl67X@vger.kernel.org
X-Gm-Message-State: AFq9FYIhytB69Af5GkdXNzyK4jouSl2Oyc1LO0holF+DgzJ7TP8HecX5
	pAbpVGpVl7wNQSQz0IyUJ01VckUjO8dttm+W0FhhD4DGtXZpIGXZmx+fI8Dk
X-Gm-Gg: AYBFou2LKQsw0R2FfagoV4imDr0WZYkXjJNHpgXfvJR1j892LkjwbRpIwG6q3Y8tye3
	FtJmryxKsKy68Zvbbys+ATDxUHJbiWZugKReQmNGdMKapAcWDXgzPAdAsMumlvuBXYnNS01vRoU
	39pGEbN/m6fdMCBovlLHNn1lZsfgY8x9xHz+ZxesjpzNQvEWNLBz4DmjNY51F3FZHzRPiXA7xkz
	BsSkMkZnSN/YS/+caRAaJNUhflycXYr97bGsR1a+lV20ibwNvW7J/nY7nVZBP4SY60NAZkPH6xm
	bkxArTaR68cxXRy9imQetAPU+CEl2L7R3BZWXtofAUaYPy0AgSMqnomZN2fm7IMjfhYQ0yetivD
	0rPj1z4lL1YxS2nD4TMDy2hRKe+Vy4K97Howhxe4mh52gMySEVLKSSJyyJhyitPikqu5+EL48u8
	0AnI7gsePU9xeWYZ4+WzkX1r15FtTHfKBDQg2vLMSV2wBhkMs+6+BPTcUq5qvugdselYxs1r8tz
	dN1cRwb/UAfTHNyqMqqHDgD4taI3ZTug19kOwbY7nZZG+juL/RvMZ7AadFnrLhi7NcizW4ypJHI
	dvfNkNVCnVkDqJ1TNfptpMDqrAKTmWHXSDGvi20p52P5P0yxf58YhH+Ojw==
X-Received: by 2002:a05:600c:198e:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a35acafde7mr31200265e9.30.1792853878070;
        Sat, 24 Oct 2026 07:57:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm50327315e9.2.2026.10.24.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:57:57 -0700 (PDT)
Message-ID: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Date: Sat, 24 Oct 2026 16:57:55 +0200
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
>>
>> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>>> unnecessary.
>>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>>> context banks.
>>>>>>>>
>>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>>> provides no way of doing this.
>>>>>>>>
>>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>>> and secure.
>>>>>>>>
>>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>>> etc.
>>>>>>>
>>>>>>> I'd recommend following the same approach.
>>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>>> similar case:
>>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>>> Let me check internally.
>>>> After a brief discussion: it can be either, depending on what suites
>>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>>> bus or not).
>>>>
>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> The rule is the opposite: new kernels must continue to work with the old
> DTs. If the new DT breaks with the older kernel, just specify it in the
> cover letter so that Bjorn doesn't merge DT changes before the driver
> changes find the way into his tree.
Ah ok thanks for clarifying that.
>
>> + Bjorn/Konrad
>>
>> Not sure how strict is the requirement for compatibility with older kernel version. An
>> option in your case could be just do an override in the board dts file of the
>> Steam Frame.
> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
> only used by the LPAC?
It is a problem because, even if nothing touches the LPAC ring, it's 
firmware
will still initialize and that will cause page faults if sid1 isn't setup.
>
>> -Akhil.
>>
>>> Not sure how to address this.
>>>
>>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

