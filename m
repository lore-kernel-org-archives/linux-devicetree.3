Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661107;
	b=mMV0rKSVydX/Uhb1xL3rKL9Z2mbpvA+kxhVI6pnOp8qzWfoCZUw2kdh7LjLiD8AQ5czm
	 de7LQudJ7A5Vz5DFv1Quf2miUkEmHcdcQ2y460d+IifIs1lgUxtEzOoU7H5nrT2DmZkfc
	 S02MRfp8c+3qe+Iv4Zp3BkQbKN29FrQAatmxxUEfpSK+YdrLIsHHMC9QgMIPjw6gQzLEn
	 Wgcys2bpMlx7QfJ1ruTkQ1q4dyfhXEpup072/1Oe78WU0tG+MiH62oeBRU3jChYgjxUZY
	 55NHAxMDzH0W6UbHXgZG4mR1KnobsaAJoduJRupHOXMnSoJ6JgWKhCGhhw1ThAaR8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
	b=4AeTXdYgTNu+M44Zl+trlGClCzWN4U//smYYdd3FupuFgdCJgnUvSruvkfPYIB0jkI2C
	 rx7ZOGO1Ec2Kx1eUM0+JtfhPt2Hs797zVneC9yZiH8VSIB91SIYBGv9lYXraxmmQ/TVeu
	 8cUV7MSd6AQGCUpVneP9v/mzaMWoTsihC/H3uS26NsRSOMZvA1Noaeoz3j8zTSPuTKQ1a
	 SsxzDTB2b8z2Kw/NONlQBHozlzR6hjU2sBQdJevtVw7ufIwADCccJ4AeJLDxTIX1WGRd6
	 hK8B/xR1UXpF3nIUiwY65l82GaoMaO67oL6ARh8Lx2l38jpMZclrlUVVYvhEN9y9hMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447E606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D447E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708WO3517483
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=; b=SNIfWIh2BD1xA3IS
	9RpYsnwpdP28ajmvhxjpX4BMqNOVJBhdP8kRs40baV2IuGExQd4v4ZIiBrAhZtWa
	3peEUMOVtKhoqpMqdXyZ1wdRAt3Pe1jSPCnwV9DDhTkAtAvE6AzGptZYBAqcHVUb
	cRCsPpPWNsWEP+TrhldvIT9zTccRvAY6QdB2QBJ7hLYsOJCf49+JfDQalYu1wnAk
	cU+mz3ElSZ4rQ/836OPEh0juBZqicn2pvgefCzq3EVdHoviR+yq4G63RoGuQ8jdh
	5CaIYIH5G9cPMkdP7GT+L4ourkA/US0nA4mb+Udrh625/lYY8KxGs+ftiCkhjVj5
	rwHcTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhn8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so37288685a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661100; x=1793265900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=Y714SOzkNwNH1ib7eT6zvW0EkbehqGtYOUN3l/Ew2v4InJ7k+mEnO8qRWuN+K6MoKu
         d7jySZnv0O89GHKNTK4+GZ3NzBv9xZh8GUjU3d2GNsdjpzjk+y3ZyT8wFRAqNsVzPb3l
         eTR/8t4yxj9DPohm+an88S/R0BFd3QFDwmxjt3VIopo4oUQbkikCdBtQWBS6C8GGvZ1l
         5AXXd0q8U3XXstgOM0/rh2Gad/9YSqsjPEbn002hB68nKxdwHWOyN4a11NrvMS7iKLdw
         ZSAAYXr8Twi0t2EZ3tWaTOrMWwrhvztSO79TqdCcxT6OFPTucjEnzF8Nc5nJBNkKVriF
         sFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661100; x=1793265900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=X4xk2ZwzgfyFEHD89R7yoSlvGXR2JgmDNDuCcI/Fojgp/HCTRANxmrx1vNrKGfZ3Gh
         MzguglyPz5wXzitkWm475LM0ooki+FNTTVyhEqQCkJyG92qb1zlx8iOvNdfseF1+QD6K
         M7v20O3sS2eombuuwxSJK6v0SfA9CIYDO89w9f6fcw89JHgshmvZhKQt1qnQBAhzQXRE
         EMeff91Z+WXJwjU1uG4FNcytqft78/ujm0a3oskVa7Y9nrSHrdZNUZh9RymkTfNLidpn
         +RKZjVX4x+2/kL7tj0Lj4JViGQq4JVfQy+gkqeiX9qQivDh2dLX6wyRnHSWgWFtLz+eO
         aLtg==
X-Forwarded-Encrypted: i=1; AKwUvByR1YLDkfinh/L0YRgA3uBaDE6GX26BsjOd4wEp7zjYLRs+xXVaAEmVHDZB0PZhlOo1HZiVuXvOTa9f@vger.kernel.org
X-Gm-Message-State: AFq9FYI3lsViAiRvx1Q10wTpz9TrU+jRi9Su61qbWizgjvF7Or4Wc/IS
	TnVTmjhmEHPQrEL/ge9w77MDMTrq/18C07KSgkklBpm4LYnaPBgPE/+ZyChrdC4jHh2K6sd1TGS
	M8+omf3nLCwS/CCQd/F8zX8bG/FvjEobXkkReUYJ55AyCO8/wEPp9oDM6iSw5oh2y
X-Gm-Gg: AYBFou3qTFLcOl0f4ePIJHsotEJtPFaBnrSOEQRp7uJLLi0/D3SPSEnyGtJIdbG66Q/
	vRpw3ka2+qCOb46WkG/SFmZFiHWU4qvtZUc8JhxFuILf1IdQ3dqGS8mQyPJRNIrxVl2TRFbqJiE
	41MAqzbUV15XxHGG75sKd6prdMNJQ9vbXKstRmUKqoV1pSto8Asy7eF1fmF+KglrYgakpEE0Twt
	SsID2QQSwCB5RSz97iuUqm9DVyuya0h1bNjP3WE3LtBLLpctrqhnSkvythLKiIZaUs5URmHOytX
	dI6PXGd1r3k4yZmfFZJHyTlCLyajOnIEFEaQz+WS1L6zZF/x2hSINfup6kohzncxYmXbkIQ508p
	5KTOZ/EYEAzIKql+vRPBlTg==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909631685a.5.1792661100097;
        Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909629585a.5.1792661099662;
        Thu, 22 Oct 2026 02:24:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:57 -0700 (PDT)
Message-ID: <a00c39b1-e993-4cd7-94e5-9bcb2494d679@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:55 +0200
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX0Pz2MG8Jro4L
 babnFSCSnoM2c1B0xaGDveCuwmxNNBeNT10ZR0XbawkbFhySSImCHPMgBQJSlMWPglgKP66fQCy
 GitzkzcCOeogoa7kf0GbbNNwKb0bvW4r6+6A9Hvdqad2ZSyvx6C6C4TqUG/6vQJqOBnTmuUBiTW
 xH2YIfK/omTSLyblKkkQ5MD0wQ8viUzSCz2XoSdVf2BgpgNa1gYsEXaj5hc4hxCtkrTRLolOMvD
 FPJduO9lb4ldpR8hvj2iXaBS9+c0m/EzGKhWOOzJlbpOHK9BIZGE5Eq66m/uoR5NH2pik6UhbOl
 IkdDfDpezIdcvVZkwBfUQdes6lHjIFl3SgUFijlEEa1SC4iQ5ooJj50jOlsQQtar3TuaOufGB0e
 n6/NktwzoLbGst22z6H+3gZBZHE7Pp2Bt3JVPPMVfje/7krtwfplP590OaJ2MSGPH+0ZyClEOg9
 C9ZNB9qLVPAzFlJROJQ==
X-Proofpoint-GUID: 6hDljbEuAx5FrMYvSt7DBznsCOec9Msu
X-Proofpoint-ORIG-GUID: 6hDljbEuAx5FrMYvSt7DBznsCOec9Msu
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9d66c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8
 a=0q0syt3hQrrWoPH5w1IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=6aV5INxNnvWGCTbEtcBN:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXzXkEoMquIbvF
 eW/yTFPdzKuyXWf8MhRtDeynE+X4Gff97ALC/k7LTh2NHQmp6SP3DdzajfGvF49GWZzX3a3BdHk
 iJlpNBCd1qswRNuWSUaKmceLD4YGSiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
