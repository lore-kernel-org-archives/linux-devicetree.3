Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB143DA4C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788873; cv=none; b=tWPY/MCrI0xpP7B1fOKGcifWTy8fBZpBV7xNlXxO8+hwCnOFc2mx7fQ9ZFQWAlv9qCdWXxQtgkuoiAWi7IeqWlh5lOIpjBeQyJLk9fZimGmEbGLn08pTaoQKrwofM5POmNSOWh8NcGyuaOkr5GoE+UCcTPfJuHh6AXbpdxvKuNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788873; c=relaxed/simple;
	bh=wyIvfO3AJDS7jsg+sAaLI5vGI2NBvE/NGzSkTigIFpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=surZVVb5ixOt/ipDRCmze49hHaIGWJywxjameUsBnRZ7XqmcTiMwJxb8P/ngBknDr8xW2dNHSNzn8aloBeAShEUIoNv8kSZ200M5HKsURJ1wGvWcLbVv8KSjvjqytSBh2FPUrlFBFsfYxd4MTBqYPlQKfq04UjIS/7GqOP4nAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJzQrsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfUdY22S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJzQrsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfUdY22S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55ki52436600
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=; b=HJzQrsh9IvHeO/wR
	VoNVJTjuVOm0bmH7gX6xUrCkUYtkZ/coJTCEj1qfwcQYuCwF9fg0sCnJ9qze2Htl
	6WPZpEljhgJdj4rB3hJpSCeVFlgWjmWwSwRvZXLsKS4DApXIKd054ZkxMsj6awVw
	Jyb6QxF+pNrFLPhVggLst3h+5LJQ2apEQhduAw2yx/xBl68dEN559/YHfOJagJUK
	U7glh1OtNX6bL3hmZU2bFIGVRmH1nDXhS/yKBTT4Prm0iir6a7/p2LHdBLW9399f
	kVJ39f/rHddo19ZOgVHCFiXKDRpLDVOcXFsFGpXEaaf0gexQhWb5MFWkzRJQ2nsP
	HFLZ5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fdmd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbeaf07a7f1so297577a12.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788871; x=1792393671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=UfUdY22SQotXoSVgwRbvl1MEZdlOb3PZA5Evocmcnu47KeIk7TKTqsS4VvX+oVJ0rj
         8JpM33CXEFM0o7nUzeRnr60ePDY6tu0j8sFQPZ54ZahPAlCUJJreuH7CU0xgTJ0+equR
         AErMuaVF6O5QAGMU5DR92zYN3w+l8+c2lEPbBstoix2BuPoF/HJ9mlkpS7bF8aOz6hBc
         HEuYQ0yEd9zP2beF/wITIP4UjjvfPhUxpDAsjom0d2qIAKMur/IkAkOEmWsko/Lj4I/f
         x0aNCYG+hR5jpGWnwGyp4EfgMIz95j6JM2dg+FbvmNdQkwOmI8KjXLyS8Zga5TDGdUP4
         XwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788871; x=1792393671;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=TIJqaO0aXT0qlmAoPW1vu+PJyflZ2zsbGoGTckQ2JoVOGHcctunL2QRHpaDWlSdFEw
         jVbx90DQxKLGOTXFIozX2Iuapzy6f1U0PV/xIQPS9usdMglj8j/FqlH8GyibMiP/1iQU
         td34oaWJxmDdmV19TgzbbxpRbfVeMpfsF5njs7xRuRXih9pN6Mp/45yyPxHZi0xvONZ/
         Hl+FySTVW4k26+OXrtJmoxN6iqYa3AgSppE1/7B0HIgfStgE/U4nYr235Lw0G4gI3FR8
         UJHm31XL/VouIEzHeA2odvt5Ww1Kt7EU0iZ8pgbzlPQTPS4kCtslE+ToTakOpweJoFko
         awaA==
X-Forwarded-Encrypted: i=1; AKwUvBxvGFf+MW9JGcz5Lz88G3K4ywt+IzGHg4ZVWYAzlps2lNFFkrmiLbsNNXRXic5zKc0H/tkpR0zD01k7@vger.kernel.org
X-Gm-Message-State: AFq9FYJejaWcGvCWVpPu1rB/xoWHTL3jSSvDfn1xqBlzezsEiyLK91tq
	EoHnQa3oWNw22iML1SbeRx4zQwtc+COdTV1HQ/mdypsyMMoCkzhYiZGdbKDqTxDVd8aU4lpIZgs
	426c+VcSTDIgM9Z7PHUBAINOIr3ZmQKVvcMT7/uGqshglCCuyJM5+Jqzeacb8zeSR
X-Gm-Gg: AYBFou2L02lNNvy2QRMmRvk82U+KzivNGJsqTTnn2lmqNVWPhLdJKhonAGVH6/hLrEg
	4bOJ+YWhhPVYhbC06weAEAx7H2sSfcjlgn9WdYHo8ntPYoF77aelEoabSuI2vtEpjZHJbMdT71c
	WqrvXAioyM2tDkf6hothqYavMUL9sPLtkLFQPJHVYrW6FIYEi5Lr9LZHuHgnbht02lzWmzKaveZ
	/dlVJOEL0yPXboUJnBMvITW8rnNJztmJ3PwAphnwB6ann531cLzbpqdRgxYqoa0YrhQQ8KU4AUp
	0+lyFE+yAZ5YxCjny5f4oMO4ctaNbs8cq9LjG0ZGNGTNJXJeSvdVUtZOcyxwhUC1SBeZ0KMsbaP
	f3GnZnqWMvDc0ILQrYjC+Gr8Xd9D5prEwW2gDv3ehO/ly/YK2Kq1a/jxnEBn8axn35A==
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115605115ad.2.1791788870653;
        Mon, 12 Oct 2026 00:07:50 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115604485ad.2.1791788869724;
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e888808bb6sm19887445ad.58.2026.10.12.00.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Message-ID: <a06c2618-a2c6-4aed-a41d-9d6f888931ea@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:07:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] ASoC: qcom: Add audio support for Hawi and Maili
 platforms
To: Mark Brown <broonie@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <arPxJqKoCXfF4TCu@sirena.co.uk>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arPxJqKoCXfF4TCu@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX1hul/EYxXksR
 4mo2s6GCeCRhUmdkJSq8bXX3AvJyyBmMqabf6mbzLiMYGCG6d7qVQ6tLYwubwwy5rF1WzQCBvIu
 tCc+Ad2FunDYRxkGvJssalaefL1/PWA=
X-Proofpoint-GUID: CfZkRNB8sRc3DXFXsAv0hmuhA975KK7a
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc8747 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Awcj7odc3Zx0pgQxwzEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX0flwoeklAZTi
 pattBato3j7jHLsQNQphldtRIoyW0n1d9T5Ux6qizfwjflJJulxr9ZdpKdU1LE2WFi/aklE7ymY
 Ee59zYkwSgprscbiw+Drj1rO/ty7c1C1Ko3uxlZHmsPWrv2sRGW+cJRn36Hw3A5v1WnooPET6Uv
 MkZm3wqnBNqbCqYxPhtilI5GQqnuiINgv+oAUp4SbC0H2kX2AkQ0g4P2Ad8lSnleD68R7+XloC1
 CZhRMtNWFzgocWvXJEWWweBc1CtSIo9n39+xTeBHvPojgpVKDYs4Sb0QDhehMjEZ7NTU+CV7AZv
 +01RWZxzYsGqR1E79bgHmqS7+VaN2kbyqHmd8Yer70Qwi25Inzbv5f1kFHxsRUOSKfLlt8pW+MQ
 kO32yzCHqyLKapYCPtx9eBrTifB58+5jZhcT8VFcdt0rqGgFXVJ6bK2MUqv3GSvoCOtEwbBgOUg
 EqLXYC6fZeEBTNfLjyw==
X-Proofpoint-ORIG-GUID: CfZkRNB8sRc3DXFXsAv0hmuhA975KK7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120028

On 9/23/2026 11:32 PM, Mark Brown wrote:
> On Wed, Sep 23, 2026 at 02:16:19PM +0530, Prasad Kumpatla wrote:
> 
>> base-commit: 6c58e38b255a3e0c11e513e3b8de85eb26fb02b5
>> prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
>> prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
>> prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
>> prerequisite-patch-id: 21e9dfd02f282ea4239f12d91ac8a2be76aaad29
>> prerequisite-patch-id: 52f17e16e09853e366ecc3da2676654df79daf06
>> prerequisite-patch-id: f0b1cd1f1f8daf0e1814a338446d493d64c9469f
>> prerequisite-patch-id: 29a1620a2ea61c0b7b052220e5ea522b1fbf2ad8
>> prerequisite-patch-id: 0872295385e6712bf342d84f095ec3710abde8d8
>> prerequisite-patch-id: 69807d41bbbd6177da4374639ae280501f3f60df
>> prerequisite-patch-id: d9f8613cac873926d6d2fd77e45002d34954b434
>> prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
>> prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
>> prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
> 
> As I have repeatedly told Qualcomm people please stop sending me patches
> that don't apply, please collaborate with your colleagues to get
> whatever it is you depend on merged and once that has happened send your
> new stuff.  Qualcomm is sending a very high volume of patches, they seem

Thanks to Mark for discussing this with us offline during LPC as well.

We now have additional context to share. Since the SoC was officially
announced on the same day, we are able to upstream the device tree and
audio support together, rather than upstreaming only the driver support
ahead of the device tree series.

Therefore, we don't see a need to hold back the device tree series and
would like to include full device tree support as part of this submission.

> to get limited review from other Qualcomm people and progress very
> slowly.  I'm getting a lot of Qualcomm code sent to me, in hard to
> manage forms.  Please also consider helping out with review of other
> code, not just submitting your own.  This is not directed to you

I also discussed this offline with Prasad, and he agreed to provide more
public review feedback going forward.

For this specific case, we learned some lessons from the previous
series. We intentionally based the Hawi binding and driver support
(LPASS codec v4.0) on the earlier series [1] for LPASS codec v4.1.
Although there is no hard dependency between v4.0 and v4.1, we felt this
approach would make the changes easier to review and provide better
context for reviewers.

[1]https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/
> specifically, this is more Qualcomm as a whole.
> 
> I've dropped this for now, please resend once it can at least be
> applied.

Well noted.

Those dependencies are actively being worked on. Three out of the five
patch series have already been applied. We will monitor the remaining
dependencies and post an updated version once they are ready to be applied.

More details of those dependencies:
  [1] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support (applied)

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

  [2] Add LPASS VA CSR HeartBeat pulse clock support (Reviewed-by)

https://lore.kernel.org/all/20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com/

  [3] ASoC: qcom: Add shikra and Hawi LPASS macro support (under review)

https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/

  [4] arm64: dts: qcom: Introduce the Device Tree for the Hawi SoC (applied)

https://lore.kernel.org/all/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

  [5] arm64: dts: qcom: Introduce the Device Tree for the Maili SoC
(under review)

https://lore.kernel.org/all/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

-- 
Thx and BRs,
Aiqun(Maria) Yu
