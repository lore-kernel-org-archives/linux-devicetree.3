Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462550;
	b=tmVZEqbOJ70AlKvdnMB+KupIeSltIUJrZWPaZ30mEoSIcdfMoS2FrsghSJ4XfdGOS67c
	 zp5lZ/xkfoSopPhvdrNT3A35uagN6e6gNMK/1We0U+/Jz3N2YBQ0KmCcgZ3fMswOFdTCD
	 4P031TnuHzNtHOe9dTZyu/smExpoApnLi9H7LLTEVL0HdiU+o51q2CEh9Hr1oYnCi9kFk
	 aXnuk4RYe4q3Tsyo/3VKj+vb2zGp7RVkY0drlYL+8eMukrgG98+uiNBTfeWsDJtzTrVCf
	 /7rw3BIZ/fDhTv1W9+hyKtbwKwKn9PIeRoYucOwGsUJVNrlnk+gnJwiyz1tW/t6AzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
	b=hqCO+3NDja7SM8EQ5BR8u1OFroZWsPLnVs9TvSHiObFHf5aLLhgGCaM0IL25vcPNMSfk
	 vhTUnsrD8d0SRGkwowGIsL+2VF/LUAxfG32k1Z6EDSBwFnkJ2aiZmspSIt8Ydyzt/aaZ0
	 l/ymi8S6Z+kuJbvCf90dBs3JN6u+/yfA+wt5Fd8c+As5evtxyUn8HTrP833sib4ljPW+Z
	 CU2RwAs3eVBir8BGW2evvAnMmzL9420B6ZF2Rp+IgyRjsub0wviONsjPy5hj3K3TkyE2w
	 5Zefkag/y0K5fiNGD3L8WNEX40pxK2g8FLNf+gRAS7diVg6VyI5Rj8yP/k/8UVAH63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18341606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18341606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGsFR846532
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ATnvF+h260FN8MLJBDwPRObd
	JGnZLhXg2pCZXyHXGbU=; b=mbW++9hUY1fsY0j9H3BpmGB5uG0rq0SXmEcrKWuU
	Wf9JYPwsuvAOK+PxMP6Kj2JzDlPg7DrlLg3lK/QuOAv9ufsKe7D8kb/iiU84RafK
	GSX5Q0Ia8SGbmeXx3kecdW1ekt4nqx4aRfQ+q6Ge0Sv8wg0d2IvUmt4xfT2tXbAF
	mSkuTfXYcLzvmpC3cXl55FdIZPo9mD2KRqL11bK3xKGobnxx7UQMisoVFgHnWfuo
	kdDF85Ike6zWOL22+nXTEQ0adUvll+OdKsjQ5hIHBayH1Iyr0+e7mRYxHiHSZ2UX
	Gvj2jesB0GjQyyjsoXYd+71GxaWKkfvx67aV9VXllJO/NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7435gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso431273885a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462548; x=1796067348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=FNvIce9Y9kl4KucMgjkVaUy16fyeRO9AkJnYoQ2f3mbyc16DaSBE4X0716+/GTPnZE
         MX230URmWf1ItEIC+95VmNbh1gpJXUw52WGNRPLPwnYTUJbF38aNYluAhr7RyhLNtCMu
         0zNk1MaE9wlgXjWvifuDUzlG28NC3v4tObJ+1LccpSS50pGJAZbvEj3vItTXnFKW3yca
         Xg8gtug1KEyef04U6Fp6oZxzQ18oT7BSqx6DVJHXgqoVKet+/kVNTJeVe6Iv/MSSHOcA
         vF9nDyuAfZ5Q579Jaadp53XlVjgCiEIQTp8W7fd6kTnuy2Me/Muv/X0woVwJxWIv2Wi5
         /urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462548; x=1796067348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=z6+rm399iLLpbziYaK8nPRiETNoRsdQ2nubkUTOEEKW/i2Wh1MxUoiPhwoamBebQbN
         Sj5SQCnHa4buvk3RliV/hT56PRLPfjrjJF6wBVd/LuKf8/FZyi9fzwutadvSwOmqS1Gx
         fINWSgTIfu5IYFxv6pISqSGox8QgTpWaP54mBw8Qv4sRSMuQnu3nK5emGk3596mNA8Am
         ZP4rX4EHYpJN+CBWKgtFhismi36s9w0RsqOSbQjigampMlHHwWfVHbm4Y0qHPgpR5uAE
         LwE1aB4KpNEdNG/EooZ5YGXbk7+R+Xn5P5rB/ZI5mQqpiqYqWhCJI2m1reodLb2fpSNr
         0I7g==
X-Forwarded-Encrypted: i=1; AL+hErGw5Q3huEk+uFVxd6TR8CPyKeWx8dmwoTynPCvCpayrn/h3JAINjz2I9UKYFH3oUMd2PZCKTTBTb52z@vger.kernel.org
X-Gm-Message-State: APuU4Z9xApTWt7YVQWfSXLb6qVuGF8KzKTpF7o5QRnCLaxTaD2EiZxU5
	hySFDN+xVPk+/HbtQy+p9Grp6L9zb2g/FXnJ8ElLfV/4NXvBHYvoLqFrqa5p/c9X70bUARUPRj8
	mymsGFtPC9x/6N5zqxSk8iyjQCWN6YhtwuDvZ3NCiBv76FBvWOZROexB6AiWYl+Jc
X-Gm-Gg: AZFdTZdwuf7obCqwFGcgY2/d8MvQKohhLaj/COSs3wl4MCz0LpmAzSejcVMSvJsRPVV
	UBgeUmQuxOXGq2zoexUkajYr0l5qVlN/WGUhcxPVw5BudRyC23E9pCz/Nmznn5LQb96O+2SRvfo
	VfCEZxk945HJXNLfxZRsnlHscjN23CRhD1mEzMaQ4hXm2kSz1jVfwtzCSznuNVtQGMrBqVcv23O
	j5bVMFxWr54iW9Fy1jaTerxT/Tpj6fyA2Wy7iYOJwUifVI01XzzDFYhw0clFPHjkEBHojw7Q7wi
	wDoO+S6ihtU3yHRLN0HPZJfeQhVLDI1jKyk4lPlhAbPbhE454ZFZNqstCgUrsgLWtzHLGtCzXpa
	SpLwU5gAe/mLVAlA/JLJSjwivYmKCJ9kwg8D6pkry6GwhJstgUGXI25CMBLaDqxmp
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368359485a.26.1795462548305;
        Mon, 23 Nov 2026 11:35:48 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368353185a.26.1795462547715;
        Mon, 23 Nov 2026 11:35:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm693167355e9.4.2026.11.23.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker
 protection VI feedback
Message-ID: <cqt5tjq4n3tezxy7qtqrnkthykx7hjocp3lxcxujkedqjaimi2@6wth3npbs5zu>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: bAa8N9_A_7Ndvrvqv3iJ9ypoGtYyHrgl
X-Proofpoint-ORIG-GUID: bAa8N9_A_7Ndvrvqv3iJ9ypoGtYyHrgl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1JZ6AmSxfjY5
 NEfRStEJY4tRHaNXhzUhAKEKOYoP/ru93b5GoUbi0m8cV1/H2Muebh9EBDao0FEtSpmLmsidZb3
 yg7Yrg1NBnROCiwYwx3sPNED+HmUlsE=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049595 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mYPpENzYAmZ0sQmgenMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzTWJfiYl2p8k
 OWMWHN+RS3w2c83jrv2c2+hrLoa1chOhiez9ykwHl95cQKzPC7Ynw3iLkCog19xDydu4tirby2m
 RtQTFcsU8CEyaYcYlBv/WBHcvG2GQtVU6kirbZSNpBg0p318KL47GkrLCIma2rDtazRNApc6GXc
 HRj7rg9GZzu26GnrmFhUsd3YlXkz+3WuvSmydQ8QpEM9ldB08C2iViTWQjNlhTiKOln+5MBeSTv
 csvI9PgRbym6kBkkiQJhtvdnC8pJv3jJU+ImB4cM10sju///ywdTq4YCgvV4tdu8xwu6fEcgLt8
 CytdqGWfrNM7b+RC1JoKnsHhNma1QQkGuvVfdiwLH69dMhzpFoME/2H3R/bRYhpRP0QveG97byy
 v8/4xMprOFwVEocANXrPWJ8MpSxBAkwAsz5zC4MC+yxPNkG73IvT5Sdn9h+FFXLPgPZecgks4uT
 LFZ6Q3asbGyqkecMCbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:36, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on the same WSA Playback link. One
> MM1 playback open brings up both chains via the machine driver's
> multi_direction_codecs flag; the SP<->SP_VI control link in the
> topology handles the DSP-side pairing.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
