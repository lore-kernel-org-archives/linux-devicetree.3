Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1C30D401
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869970; cv=none; b=g9B4yC8/2+WdFbU+hllhRrNEBGbv6pxdJQs1wXK4lKDwZk+nrR0aY+zh4HkzRCT1bRiFH0hUMGu3tscMwu/QuzK6XdyzssaAGZVt2mOlto8M3F5xQd8GFKRcgQ543viuAHLu3TAFy1TiZJfsjqiaxOW5q9YkmM73fzx620NXFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869970; c=relaxed/simple;
	bh=gT9l9AmBhLr2NEak2K89SHVLopxQpCR5Ktee65+zG6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nht5LeO8C+chTbdl3F8UsL9g+rI83ob6mDcHDcJoujoPtrWjNA0j0vIiIVPComYpiAXM4uHDpYFuIfviDWbFRHal/+LxifNJIehCZI6r69jIn/fzQtSBSJNtS6OF4Eitil3SoSThN0otL44terxDO50gtB4FM0pAYi+nS7MRwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7bu8sJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlXo92Q5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7bu8sJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlXo92Q5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21N7Z3509571
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=; b=H7bu8sJeVPd796xb
	Rb80F/xOCEx6UF5pe9ub9151RitgYHo14LzzEECSwwijs4VS74DioRjItDYZ+PpB
	E61gsnyebLKImJlrK86LdqAU8u94w4g6mGpxhiV/fIHKVd72kpvgowTknUwBA5LG
	6blAKH5tCuDQDUJ3Y1LWYf06Z/K3D2GXDrrl7LXM6qxMmG/XU1ao0wid3MnrEuev
	4UzL6jQzaMWJ7Z1tu17f8ME2wcpLXcRK80AMAdNtkdYsjLHEpmzZB40eooyfx8Vq
	MxcuLWOcqq+dVh9LTTbiQqdk7wlXNyLDhkmUdEdyFyHDic0nlvewYw2RjaBxkp02
	ChkSvA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4f1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:39:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ccacc75a997so1069719a12.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869968; x=1792474768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=;
        b=TlXo92Q5eZzUlEB0GHATPFURH69GPwf3/VnNKtJ3NkdB2tsmOgQJ9pV+W+zq78kyv6
         N5T7EhSCGO5xIAOaNGpIQMF1vHaRSgKiCebKPbwRRSEL5rRuwxdEewGQEISCQqCmHKQs
         OizjCs66/eEpwgpJWHE5OWr3ls9W7pRecMuRGR9beOMnBCprcMAZPG3BqSobZaF00+8j
         4Np+d3hAoDfs7gpj6gh7neG3Xo36vvSaj5qjkF8Jqu5+X3h9rYVpJdkbDR5ag0bJ/Bi+
         wkhJPdDCgX9c4Dmi6J06M2PowgbjGlSBrPr0bwc1TNBzZ80zD20q//WZLKjt2wcYA4AY
         a3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869968; x=1792474768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=;
        b=jZbWpd/2X0n0bl1+h3u1tDPQeP6MefN4KzcSDbnbNtKxyT4yqXRlK2lTSZilJCxS4a
         FcmmZuIPbwAnePvV3pp4vDoxCKQxflAqvwNPfOXs216RxnLG4D28iwKw8ly1GOoaWDu0
         ZABRp1KZVqQ27XvK0DYYh/Mv43vGuHUNANuwgy4SdfR82yrKVVqysTFapCAqFdEJqkGh
         LUm6Rktd8kFe6z8oc/sV4nFtcT9SmZ3hUEZ42ZWPKRfOFoPgQ1JgFTzOcf0BugBQJ8Kl
         7E1xnxYCE1FW4U2SW6HwQ1BfmNe9gl8onLgKvT9JNftRNPvbGA3FrYW3Biypy+8LgUg6
         7srA==
X-Forwarded-Encrypted: i=1; AKwUvBwauDLjiA8++v89f7uOgxNvJekWQrr84f1SNXGBWQJhHc5/5ru7aGxYYfAdlahT68BrbaDqbWdZ6VZv@vger.kernel.org
X-Gm-Message-State: AFq9FYIof1Ewyre9BfiWN7b1xn+mvFXWDhYdoKVcqHtStWP7JumMCCBi
	vHhTxg+YJUMVGMLxXe5UfaFgw8TOD6gchP0eG21ejr/m6UtRrfa59K1TOpPfPfIzxGR3g0phNji
	yk6iolVqjV1AEKVcAKg7UCQemGVc2STt1lPP8CowJCYqifeC4IShTPpel5iUq9il1
X-Gm-Gg: AYBFou35yDJN98oMy32MdEJAcgPJib5ycE62TSorSZCSS+OSZUvtDbvzeNALjWA1IFQ
	3NSnUNLBBlYmB4LtOSAj03xYm09wg/ednFG+ThmunVMBsN78evJGizqDDhazGNKL3gRcItKSKw3
	PbzXvaQhWSbLjG264ICR+v38WsA4zf0QR6KIkxLGPXkcWonV8iglLijvkQYMbyivUeYhq/344VC
	OvtSQbrvYK09gXEnAVWetygeFajZ8uUdvguYCoFUI5Cw+SUV+n/30NqQSS0J1alktTq8av244YM
	ZUfAfcc8LNxxjBdsc0ih46GFK4H4XF/4/GkYqdtA2TekeVMXajFFB5GnsnBCBPLw5kRVJm29l9H
	dYIhonYL31qxA/gXvcFD7yqBVrUFTgvU=
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr9501752a91.67.1791869967940;
        Mon, 12 Oct 2026 22:39:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr9501737a91.67.1791869967476;
        Mon, 12 Oct 2026 22:39:27 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0332sm20972016a91.3.2026.10.12.22.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:38:58 -0700 (PDT)
Message-ID: <580dc86a-08a7-4196-902b-ea2860824407@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:08:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
 <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX8jlL6JTCUYrw
 xOBpKYBH48mhfN9sq3rRUxRxHuP2/NShsadOBBzAN0RoQEQuiJu3P1uTyhuM9+e/0MpzY4q7096
 EG+ytvcaRKJ1UQS5Ok9GMrKl9KTYcj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX/18WjqnrfaHf
 Z+TH6DfWbuP+C8AkF3ehvInJwrRxi+WdGrXyi0wjApsqD1Peidyyiltkp7u2CCdOFFozbVEdxoB
 6y7kBmXZYokgKFmAPBwYt8XKyQD557ZaUUrTR+TrRwdE1dMHBqs6R4c3onz6EdVhnFJHCbvWlVf
 bH839922/sEwY3ujnUvroygtWV5/iHYN066stmg79sCS3aizy79QQrsbNDsSZI+1bRGtmUDh2n+
 ISR10SQVMGoj5c2XQTPVzDZ9cWJtc98BGklixxcRIYFKA+A09ltQUaHBAHJoY+mRdJon9UOdq6K
 EWKWlMiwlvR/MF7a2/CA+7jwdnXiV9CgiYEwXYCED0SCPLm5tkc3jtRZOCa87wQg2sdaR7ExoEm
 QVfGCJzOyLVh0Oaa1NKdVPpY0klqVALV40yZmUyn+Azowk9Nh++Gv1Nes/91C4YzFE8hw9RTOka
 EE5M1i5HwA67Dm754nQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc410 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5Mj297_3T3Sy0i_chsIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: __g-91Pfbq63_OiMVQGuPgT1UAaC6wwR
X-Proofpoint-GUID: __g-91Pfbq63_OiMVQGuPgT1UAaC6wwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022



On 10/12/2026 6:33 PM, Konrad Dybcio wrote:
> On 10/7/26 5:54 PM, Vinayak Katoch wrote:
>> Wire up the dedicated CDSP extended context bank on kaanapali and
>> glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.
>>
>> The FastRPC driver identifies an extended context bank by the presence
>> of iommu-ranges on the compute-cb node. Each patch adds
>> iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
>> restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
>> fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
>> and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
>> all existing compute-cb reg entries are updated to the four-cell format.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>> Vinayak Katoch (2):
>>       arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
>>       arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank
>>
>>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
>>  2 files changed, 35 insertions(+), 25 deletions(-)
>> ---
>> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
>> change-id: 20261006-extended-mapping-dts-f60dbc6221aa
>> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
>> prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
>> prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
>> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
>> prerequisite-change-id: 20260826-extended-mapping-9b08b0c3108d:v2
>> prerequisite-patch-id: 7fe093060212472237ebfaf12413fa38d662e5b7
>> prerequisite-patch-id: 86acb1e79d10600734d07152dbbc3010977b85f8
>> prerequisite-patch-id: 08da00c4dcbf2e77ba217676bf93daee78c20e79
>> prerequisite-patch-id: f6a649d7e73501312402b084adee4b5fb3d83a44
> 
> When you send a series claiming it has hundreds of prerequisites,
> it can not be picked up

fixed in v2

> 
> Konrad

