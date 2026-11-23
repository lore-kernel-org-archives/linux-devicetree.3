Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462330;
	b=xvJsPaHCZNBTXiD9BVZqCaZ9PPF08d+cLmFvAYNpszpO/9bZQCzKkT2/HesePZas3KhC
	 zpAmNNu4to8Yr+5lUwv+bcAx8lu4EPfSXz8LG/vXh4mKSROq8sm+zdXXVZlvJNtEC6gaX
	 xhrVXxiBKTn8r7pAxhJgf+uFVy88p20Q74ThIg/go4awGj4IZP7uUWq4gzTCIeyrcELU+
	 aoSRFt7T32xxeTurmYPHtyU1FpaU0HdgxQL0byYvUEzcgrbzJXmhKXdl5IJlJ5jBu+Jmm
	 F9/nwMbnB9LxgIrFiosm5vdLdxJZTAX/hOa8p0dmrh1nkoEHGTLZ0G5uW0B6Kh3RKuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
	b=FOFSA0KM8KOMEicvTDtHu8dMjxemg+DOshqnSghHHAuUUVeTBJXNzn8Sq752y4PzFxoV
	 uzAHbTQdGRslcFkQ0UaLMxnlQs80bucqgaTExKZloG7PqXprMBV7LhP4YRj9tSUvIcBmb
	 9H8Ao8Ckmgvm5FrbhmlMI8BjF/AqK8GNVbxHvpxA5K2U6O/yKcyTb9xc3ZoDzid0xCUS8
	 ktnpGCSzCnaEFYXwmWvWrgUuGuxEeBd5ge5F6i9Y/n5lOiUfY8tUp0K+a57YKYYd0tp6Y
	 ukSzx7dmCLSW663V42vRc7fBLFYUeQ71vAQuujhJwziEEMUhuil95FsROD3pi4V0xgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BncCGsEb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlAHa4lI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BncCGsEb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlAHa4lI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGno91861249
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bl3tukg7lSxKTZnMonfg900t
	TKao55hWsKetg9HhTTc=; b=BncCGsEb5ImP/xnUL/M5IBFLqrCp0EtHysgc5K9A
	lCIUpWDrK5QLyhzj5VZhIX4lNQGFkDcUcO6Q69Atu7sNKGBKChv7hJAuXa4ky86U
	n3OmFyy6dZKrQ7RtmpMyWpW9+pegGJmcU9TkVn8EteqoBTru97TQHY98MOpyC6RC
	+wzaGmsC6kaBbUdcxDVWjAQHkHHLhMNxvmVH1AvaWOUw1gEAB7zurQ3fdwRjy2lT
	yy5jEG5d1u00EMxmEIuZWlNZxubCfg0Hk5MmkCJJobJB9Ppm7zB+ncHfi4y/eQut
	skCoI4rnJI+d0ptPHNyaXOFB2ccvDEsabWx1sw2LDZf4Sg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a333t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4d1e90b9eso30636087b3.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462328; x=1796067128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
        b=AlAHa4lI197rewfdmAU9Fu2VRFsc5WnQq8bPril6T4EZcTO0vcygI+or8IRhAzlBPM
         C4Ti1XoStB8r6Lir4o4PmZO/fnOPmAMQ92L9QQt3xtcUH8z62q+NMZnHwTO14szWavlp
         TtIiRsdBoMAtN/B1s42422YiV//XKjmPVKpoe+h6onY7OAvL5MKQ0AUfe8bs/BAwrNwi
         yMu5x6Q3Al1mfGwbdc3+qbjCtfg2j3K2akcwdjBgoY0gWSfHnRLdCK2YzqEbFEZJFusE
         Q8ZLApFev1vBGIT0T1czuEefc9eEWwLZCTxTLC5SdtqRO59kUMbTSy6kyvDA39z/sdm9
         Zd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462328; x=1796067128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
        b=lAszuvxV0upB5myIl3TuDZh9iFBCIvL25KymcwScl7Z9dNLsBTTvJU3JhCBHyNwf8/
         hHWdLCp7OS6PV2Zzpv5IPJOFOelWzLwHL+73ceWItMfNav0G61+Hkgsckx4vqC7bTVOm
         FcSeRukFTDMId4vvNr//+e5CCxLPYRqac1qKzrgeTg9e5ss9VeTIuXGMg7fj104xHcc2
         85ceI7FJNS7thgDfzoo+oV1c2wZkQ0D9XZ1oz6nqmoagK7wmZTooZA8aUuh29Iw7Kk3R
         05PVkBJIgag/IMbhYTYeigsAACNYvW6a2N8i7gDFwJXi91iOw/unZw59xQ0zSCoSJP+q
         +exw==
X-Forwarded-Encrypted: i=1; AL+hErET8RrZ148Y15RR7rPU4LzOWH4V2VnjeJd3gasDim7pJNcvWSctDLOxgt/IngitHDkB+gZfa/WXjvkb@vger.kernel.org
X-Gm-Message-State: APuU4Z9U58u2KFLuw0rI2LjBckDOjWcHOCTOwKN7qjmCbKId1MV9lPma
	g6q0Z0IV/1C4uH6uxQp1yXdM9x2U3+IFrkJtIWfgKXDIjJ60TV8NmdYuKgEcHDqAPZeCDcy5eaG
	bdEdxo5VBIBii/+aaUAm1c5OLUuPVsfs7K10whalT9o0XngGg4byhCmN+go4gLD9o
X-Gm-Gg: AZFdTZfI+6irYxldtR+e5Jia3ffSw/Itsz68dXOiPMuCRsSbiWXvT+d6sSpG7GnFvEy
	ioVP04WK0taLsEC7P2VsgGQcxX1Sh6iknObFj6rWfsV5tnYpTQFoHzfgGwhpkh9tFTdhhYjEs8i
	a1HfnKmO2FbuCU8wChxqSWMkf17sTlyrkiDaywFW7T+2Cnhr5Tp7qWRUDyHDCnvK+tR3zvKTsai
	9FWMuJUOWJmqX//medbyfbkJXOpb0vcMY4EvKf1dXuUREQjWsCX0TWLvfbqkPpZN+V9oHrh13+d
	7zIVuklPoh+kJQOT1USpOgpmb34bxw2a3vXkq2RWcIa2y6uOFWJe1oDmFmPUAQBUo7j2Cnc7qR6
	7IXhN8uiIBgFdyVpjIYilLmuN0Gyt6IYWyHJ2Wv53Yv1zTRqdvNp2B7hSN9thfzHJ
X-Received: by 2002:a05:690c:797:b0:8ae:87e7:9ab8 with SMTP id 00721157ae682-8b5205437abmr49285567b3.67.1795462328206;
        Mon, 23 Nov 2026 11:32:08 -0800 (PST)
X-Received: by 2002:a05:690c:797:b0:8ae:87e7:9ab8 with SMTP id 00721157ae682-8b5205437abmr49285267b3.67.1795462327475;
        Mon, 23 Nov 2026 11:32:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm23674711f8f.42.2026.11.23.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:32:06 -0800 (PST)
Date: Mon, 23 Nov 2026 21:32:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
Message-ID: <icafgm7n43hl7nyvi62drnkcdedoguwcme64cagt4e35w5a3hd@ygpjrig3b5hz>
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
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
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX/l3SL25m8YLY
 j7MuRJjOICLy0uQ9YI78ViibeaXi09uSDtwO7fdnzkqTVvm9HAXemSpLT6emBIpauKKpe2i6/Ss
 0J2MRql9xG6uxCeYgv8TLDtj2p7NfV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXzcbrdmBAmXP6
 z1EpxTE0Whh8+7tOq1Oi5iYoOC6rCAMEoiFqAoErw4UDyxNGEVZLybRTtZIdov2vFHt93tIvAYX
 ocn40vLOSgL1RtYf2BcyJQvc3VVeH5ns+4iXDifzozaXqUpfJdR3Xpf6MoRrF+OJOh8Ux8uCgPs
 g3bLd0OnyKKv8KjnNBF8VKwQ2apz/ZEJPYRLqS29bhFpZnsLAfMvHFrAin5AXIwmAGoBF75WWVT
 XPf0oKq/RwYdPprMI8XAXnFMaI4Xt5TLxqtlIwZc+QjEy+sKusDt/DDs0NcWLS/H0uIrFDMrIGa
 ksbu1iDtXY+Ik+dxDL5QuSkwtV9HrbelzFsuvbuNXAfxpA2pMbBuIyQt1pPIhbGaMXgEjQ3pudY
 KT0YsyEQgWJNUmvv42zH3rcBEtmXhy60UcfbIHcbVnChjgJAI2V9/hPtkItrCyvYRuO/FoixV5U
 Sg/u16Iyx9QJTHGgIdA==
X-Proofpoint-ORIG-GUID: Uw4yxLbxtGEQrM7N7u0KIHElSP3jQp6q
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0494b9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: Uw4yxLbxtGEQrM7N7u0KIHElSP3jQp6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 11:13:36, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
