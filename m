Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852F46D0A6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657845; cv=none; b=Ztro+Z7MawqlXmXQtk+bemBiXLQJyI73nGTOUsZr20IG5KLYrhm78hvhoHny60ljyH2hWA8LqBE94aW/5ySWaZkubeD7/Modq5kSKMYQ62HHwIOcheq6hJzTYdnQGSytwrfQU7iAg1bz6nr8xf3oeoh/+0e2SqsLHRsJPZA8lIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657845; c=relaxed/simple;
	bh=0n90vA824UpPP0KSP0R7HxSj5B8dzgPKHLVs81WLnm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUJ9ev3ttKEjXB2B+aPfgJ6rUom1I06vhwBYx1QNehu3BR1sTebMUL8RgCWhBxJEETPdrH7pjBew/krSOYDVpG/ch9sjMwAKOihYp27+Rgg2pPzXZSbH0xUqsRrosz6D0BMi4pkTM2cimP0XA232Rofuahfw2x89zfGqxh2EQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REjBvjIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8001ucx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REjBvjIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8001ucx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2Twm3439758
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asWo7RrLO7QIFKoSVKpSItWS
	Kd38+Y/tFgfYMRtjAJI=; b=REjBvjIggRys4EuYQylu9pINvADvw5L3Btd3gJl5
	mowkIgZFK0rs4zz4rX6yOE37thNO6iVO5Ja6Ooc3nz//921U76cRRa4Eu9e5Ex83
	9FJwx8XnOjjReGD+Bt94wQvRW3WBDZYozEuiNR4IKO9zNxQXjPB7sLxxYNs9eUp1
	W5Ehp1CHKLi9ImJQ+Ju+oRrlc01risX5rsJ0a6poxpO1VYMAzleFEQfDoe9ExIoq
	QeMCb7awAbOdt35c9cKf1covTs4pdOQGOFM0TfOal9XyTeAsXlwO2NLwqz09AdS5
	KMNttUxnEUXL8Fu91xxmjqNesOhU7ZMloWH4jUVxIBU51w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstdb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:17:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so182280221cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657843; x=1785262643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asWo7RrLO7QIFKoSVKpSItWSKd38+Y/tFgfYMRtjAJI=;
        b=c8001ucxowkPoOd9sJDP7csfY9qMZSNKy6S2YDudh46I1HtLjAAph44PTPFlT5AiZ2
         vPhVnU65lxFCv/ajjPSHGGu4waNFZ/H5Gvs8tXFqPK7HzuCFSL7Brvkdqja6gSMnwLCt
         7qqBGGtj8fTjy5uy1wWAe2yy59SDXbRlzq/8J7xzlRA8iL9N3oXy5eYVfQKm/2jJa07Q
         SDG2tlvd9Yo1Xrmfj0lAiTzOochyhV370LOtseSEkSkkLdRn1Pna3tAk8Eq3sf8BB4lO
         AaFgdAtZbAUPGJDmMAO+zCJc0Hauh0f266khVc2J4Sn9WMOduWAm3IvvuMXfYrpNOB7P
         r8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657843; x=1785262643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWo7RrLO7QIFKoSVKpSItWSKd38+Y/tFgfYMRtjAJI=;
        b=Mwn4x0u1gAUtFbvlo+ezXn1USWTJkYRKk3bc9s+JINQJmtCBD2ioogeTwDFlhJqsPx
         O+9DkdyNnZtHAKm89Y20Bm8ZpsRDIr8nYWFrOAlKe84McXK21fUdMTEU/IY+lXvpPZyn
         Woi1u7Yy/Llu0tU3QfEJx7AuNRlpgRopUet5ZRjvaqBwWsLWKENhZzhP0+n8IyiaJODk
         98WceQzS+UjB5qwI+//f+4r5w1dBE0yhYyGPlhUncMnMd8lXKO3zEz5WIhnk9KTn2LW+
         w/EqCYJu1jQEhmtQkkF59Gz4L9x+h+6SDLzaDyl4il3kAK6G+VWN/1aIuWYTkfOlvaTw
         G4Jg==
X-Forwarded-Encrypted: i=1; AHgh+RpUeOK1V7RNb1NM1W21eX0Aye0KfD4GvFhulItIjeZpTGV/WQNeKp+TtDhUYnXNBNcVZPpBK5o7TpJI@vger.kernel.org
X-Gm-Message-State: AOJu0YxqaZ2olO1Bc1pQWHHjZMokufOQZLnMivERP0RO19OvSZCy4GdF
	5xV4408TuQwChd3AkcH9jdU6rWSqnpm3mzWQ4pzME9Jqe5fgLt5YjZJIrkopAFN51s3kJ3Y7Ur4
	LERiOZXmEvjtNhg5WWwC9h0xqgw2n27SARKtauiOqu8tQXl6NfIrfRgOiRJsD4tA8
X-Gm-Gg: AfdE7clonbGQ6QXjgW4rjJSEN8PviE5VKj3wLtbQJfcpMnBhJMDlsD5+mOc76MVZgNS
	6MteFa6X/M5i7T7RmJJcpYnJ1q9gZePy6nNxEvFRt+lLKUUqWWBw1NVxGbC5pie6eKO40iqqkHD
	mh6j8z5eu2635bOKAcRe9BgYu3gbFbCEc4R97/a92TQBOvh/kX9s2KtEJwRUok9wOKSxN2fgCc4
	b/c5bBzHsaJsBDj1tyOp0k9byKFyQUVWNPsUKffq/BxbIOsuXDpjvCnmaVZc605eO4ZZWvUDNfz
	6aTYjp/fPD2gCiaudh8RkLHOpBjnMTyUtEztLrz1hhlzTjaudlkgULHNBnZJqXXxo0jRNSlA/UM
	5d+ihousDuDC+JUrnadwCMynyHxNdkAaX+RvDjxpDLG3Uy6xZbp/pZuIoPaexqLv7UYsPHnxLHV
	Tnm+GhAeD+WJeLqg==
X-Received: by 2002:ac8:584c:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-5213d8acfa3mr195148001cf.28.1784657842723;
        Tue, 21 Jul 2026 11:17:22 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-5213d8acfa3mr195147561cf.28.1784657842023;
        Tue, 21 Jul 2026 11:17:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50f18sm59301e87.82.2026.07.21.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:17:21 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:17:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16
 (UX3607OA)
Message-ID: <gpfggty2ddc7r3uhrpwlazuyr5ep4mfoc6mscpwimhhaztnzq4@y5ftly3u67h2>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
X-Proofpoint-GUID: Wvrb6Zvs2yCo9pgkpgUXdk4HsAE9fCkL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX+2pwHe/Zr69w
 eGP2RxgI4rIPsmLDuvL4q4ZLL3qm8n70OP2ujP6qZmzFFgU5TRuJKa25uq+za9rWIkIReUWCyUV
 uh8bslXXx7o/PiUAbaeR++kbl/0zhIg=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fb7b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QCcXpYcSlj5nmBkoM0sA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Wvrb6Zvs2yCo9pgkpgUXdk4HsAE9fCkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXzZ/74EovVi/5
 5P9ToK97fH5Hhl0AmmbNmLZjeAaXQnk8uKLHqlf6II33q342G4dyGfmC15paWQ3/y462Rqql+dB
 RLzOkc1bZxey3/QZAIGt16PuncRej9FGutEyV7vP3eVlNxLdFZ7iiKqzPYuexk90EY2iCCwEfug
 veOwpcqlK4MlDHbmttjTzO9Qx2CvAsuJuU3tv/KNewOkDlhvEI+MOzZWzFt5bqewtenMW8UVWYH
 4Dh1V/G0HrvJK5Md93w7sxR9eAMAoTfAuR7cCS7Gf6ynV5EMQgHHBPhqOP0lujoUuqKAIa8540e
 ui5MDbOsz9V0KQggD5rFoOE7Rjj+PI6sQzY+Vi2C8Ey9yEZD3CSo+v+yDbKtr42/tVPlJzkwwJC
 euMah2gCPQbFN0imDOMItz6sVHxWzHxqd9B9ZnLFh0bh9om4gqsDKGAWmaqKvxf78muW58qxGsW
 6FThj9YSHVIxUXO3PDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192

On Tue, Jul 21, 2026 at 07:11:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> Currently working:
> - Audio playback (4 speakers)
> - GPU, Display
> - HDMI port
> - Keyboard, touchpad, lid switch
> - Privacy LEDs (camera-use, camera-block, mic-mute)
> - Charging, Type-C, Type-A port
> - Onboard SD Card slot (RTS5329)
> - Wi-Fi, Bluetooth (QCC2072)
> - Touchscreen should work on the SKUs that have it, but it remains
>   untested due to lack of access to such a device
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1271 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
>  4 files changed, 1274 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
