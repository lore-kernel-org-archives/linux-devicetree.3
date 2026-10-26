Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011062;
	b=BEtAMEEZhOzDT70f5YWZt+OoWP+EBkovOcMgJO9Cv/tHSVBfUdo3UZ0g76+CgWoHi40O
	 aet/7167eGCumzMs58/u5lLodWVyilDOCog+m2CH0EWPE4hOtc007Sd+P3HKeD5JuoTEx
	 +FpkFmuoEAD+X7LFxs353MhBsgRfAwYW/tRvF753sVaiOqUySWYHCjxm1icxIye6YSng9
	 G1SBsp/o7qukv7RHtIuvW1hvKnDAYSTnOZA7WBB1Vwb+CFYy1rlEwQCTnrLkNagTK7+w0
	 FMIzOpPoZKWN3D/75cxp0E+jfLbAMqfIGl+LJwa8NWdnmwScSMkNuO/YwBq2zZ3WDVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
	b=PXFb5SpxigBGzC/TsWDPmhRqdqTA23nRiVeQqaILV0i69RNfqOGjNmXNiIMh5LdqzvHA
	 3st/JSRm2Gc7bfq/okgoqGAXDHyrluf0r2dG0p8QDXPB08ZtPvbx2O7bpUc7Apb1b33Mx
	 ARTKKEkMQl7z4qynemyk14Y/Ni/UOHHAOnNbpUiMjxqXKZHwxXMqelClkooY9ow/OXfQy
	 O1SwNiry/ez4Bg0DgOrW6ZDBwKPPi5Ld6MY83JJenHnw+5yzNQC+IzCZK5vVfGb+dELkv
	 mKpHcxr+1d4n8Mra9PGpI1dOGHUg/ihYPXJbWzQ8xipeEgaQ/nkk2rkhJajX0ZCOJRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bV/RkubC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7247606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7247606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bV/RkubC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aP6l3300574
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=; b=TpZsGSX6x4fCHbKw
	U8ef/568RxKDz0hovaxFvn9IInCc6pKY8/Sn3J7Cbt6yKqZr5KGpuZkWs9oe6j7k
	brO5+mOteKXKVH5HZzNaziob0mdnSna+I/c9Up4HcMbd6mprqlDkbSmUutdRWsP+
	eoa+c5k8kh9tObqrRBGOrjRsw4WJGbLPV4MsPhrjHrhfaDss//ip8gDbQn7ZD72+
	l+QQlPfcVAdnMvjQgAfLhDg7A6URh6DAhD0A+pYAdoljS0JxoEy4D2Wu7xtHHsL+
	cRCQRxsvNGOHaC8b82Ix7/gO/UBHgrG7XrIzmwzmfJPdUoxP39bSBmvh/XnrtdJ4
	32Agig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt02g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9178ba8eb30so7389416d6.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011060; x=1793615860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=bV/RkubCe5u5u1WJ+dTPiNowpRup6I+sWY3HNW1q0uOOwqYq3ZsF324MDv00xTkCMc
         pg6mFsCA+GtpbLp/MvJu+T4V4N38r0N7fuT0p9K7FdLTGqwt3PYonSMHbxswzTC50EiS
         nDZsos4tKHgzuj/6IjXj2qqA7hP5WKEdzaACWUXDhTHuIgDD447kQjPHuVaWVOIsNo+A
         h4UC0PMXvYoV2RySu/frdlH2YYb3mU9QhIW6e3fhnT8ycFIU26S3PCqEX1G6Q76uTOZV
         AK4n0UGSBIpjsh3hUVbhfsaIM4uEL3fn0To3xXx/O2nG/gAAN/eRRvzwiuuvz79FBSJF
         7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011060; x=1793615860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=csrVvR49iTkEXYV11GcW3cMuqmTGu1plgRfk8PzTVfitL0B19eGPV6LRDYTZ2hDb13
         olZDDCSdbJ/xtxsCbAKquWs0AS6+3Z+S/yx3teRYKG8Zl2GSTpCoOx5v6z7oAjDJN6EE
         HVbvrNDA/mjS5X5Ya7FbndG34RRtIDz1f++LaFyPTh4iUmiN5Fr5ACGHES62b1zA3DaK
         v8t6CMR+W15Zu/tog++KrWD0Wns3Os5l88hA5LDTKMjlYYyNA2HvLV6MQ3wanTuz+4Zw
         Jv5dj7nZDUpJ/AwtUOSyU55aq2krsgw/0hWb7j4yb8b6YlJWL60A1Ni4HJ1cIQkbIAvI
         vEUg==
X-Forwarded-Encrypted: i=1; AKwUvBzjOUIsGyPE/Ay5przubovqCyLo19L5Xaj8fRX4WxPNktxBItWjJ2YQuI3ckHDIP4KZFliCOkREOY2U@vger.kernel.org
X-Gm-Message-State: AFq9FYIDpVDeCFogpq6deRMyrA3v0Q1xfY55ljIpG6PjVhaLn9Fm4rAQ
	bhUnxvidMaxMKdo9sUB/vuwpTvfvd1UUlwQ5p5I3xellrkgKyhaOW04sgIrg7PpRs2vQAosiEAZ
	dA1+wUWgAuWSIsF0yIhZZaCZIz6pe89N3VmghZaxBcbyC/IZgwNuxHBywg90/CRwc
X-Gm-Gg: AYBFou3ZIS814wK9PvBx2LpmCL/6qlCsdO2WePA5e6VeI7NyG72J9b2eZmLh/66aIob
	8+4xWADbLjOtzhzSmxZY0Uc3/hqDnUGAx506wCyVJ6sg5e6vEJbhP/qhw30K8l7Hte3IUcfXpgk
	FHEbtG6a/XTc0kE+rLYY10XAv8nGSLHF1RSZ7iA6tpcp8Pmzg6aQfYvArZk+fdvxB5wL9xd172D
	FdAkZfUDWf19n3GCLrs370u90TYKK+Qbts4ovddXv5mQ3qte9neBLLsCnRwpP1xr0UjZbSyRSFR
	g0kRmg66D5dRwB9MQu7P0D7BdMWJBL7b/3svlOIG0VHzzB/1GKLViDiv8WjngZFX+UOVBQVK4jX
	9dUduKlyMhHPKUp5SCp+XpA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130934585a.6.1793011060039;
        Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130929785a.6.1793011059540;
        Mon, 26 Oct 2026 03:37:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3389733a12.37.2026.10.26.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:37:38 -0700 (PDT)
Message-ID: <7b95f254-ccb0-4ce3-9b35-c605cacdf74f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:37:34 +0100
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
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
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
 <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX6zNZhUFba3GC
 jWjbMuzXdVJN63dioaNuHsX/AYzRx5UPxFzsWfoGjDKSUmNUlWQrJZmZqQDwDmHiIY/ctHZfLhg
 fDiC9Ev/T62kWl9kpBBgwqko6PJYQhI=
X-Proofpoint-GUID: KfTncqJcGGHMiO9Mu48HXJDbBw8KPt0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX8f2RWHGtHk4S
 2N+dfuqxi7sWzp8W9sYU9SebXzMdDBSeNj2G5//peHqBOO+PYs4ho/oNUDekjWBt3GRPZfGWooR
 i1gBif2XEVFQctGgTX06bgUE6AKpMT/rKcMy4C56RGtS2MIOhj2PBBLa4agfcFqtPICgX32zpSb
 AijKkOuc4fmUN8cc0JaEDTlb2IaiDp97wUfFtqMKTMWoq2eBt9arrNVTF9Sy9F+ZbFrpcACYGA2
 wYg+kuipqryWSRJDIqscBGglgx+Zg49BaaYXTAQ1jviCH/EkJPw6TgCKXRG3Mted8lqWCiYhYqV
 vWBaEpj0J8IVVEipLdW4KBb9RNWLcL69Rw9tfcRf2+7XxP/9R4d9lq3oaQq0qxgwGxOL7+ZCPM4
 00CHX15sa+/L54YLLtJkmL4ENUA41jjlSCEAjeuFTnYqccyqBYvHLeqWxJPnJ+LxtkVXRd4Emp7
 maUKgAAs2gzq5ox/9JQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf2d75 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vYu95guM48VmnKZvmccA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KfTncqJcGGHMiO9Mu48HXJDbBw8KPt0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260042

On 10/24/26 4:57 PM, Anna Maniscalco wrote:
> On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:

[...]

>>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>> The rule is the opposite: new kernels must continue to work with the old
>> DTs. If the new DT breaks with the older kernel, just specify it in the
>> cover letter so that Bjorn doesn't merge DT changes before the driver
>> changes find the way into his tree.
> Ah ok thanks for clarifying that.
>>
>>> + Bjorn/Konrad
>>>
>>> Not sure how strict is the requirement for compatibility with older kernel version. An
>>> option in your case could be just do an override in the board dts file of the
>>> Steam Frame.
>> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
>> only used by the LPAC?
> It is a problem because, even if nothing touches the LPAC ring, it's firmware
> will still initialize and that will cause page faults if sid1 isn't setup.

We're slowly coming to terms with the fact that all of our multimedia
iommu setup was terribly wrong all the time. Venus/Iris recently had
a flurry of breaking changes. We have to follow suit.

Konrad
