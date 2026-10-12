Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885744A387F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820270; cv=none; b=ibmCiayCWldRhqsCriCpbHB75hAWqwG7Z6mIWvR+yAHvRj9elikg9fNqioFo507lhsme3enguK1v36Le+MNR7YQmTcTiCWsYVlhj7/cePnTZzu5koqyPM/ufneAEPGfocifq/ndSD5mN0cC3HqFLgnD0+eqeZS1sgMxfdlJZnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820270; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3iQifXK4X7zLHxSJOOTEvrdyr+710W7stnMMrgfvC1FnnpjSsoUVBk+u7gs4NdP0RdKm5YN25Us1oS3jt6xBTKgj/yfkDR7qTI5GVYjvrQhMdMmFtR1nqBKYJrunstAo2oCepnjkk9y6cP859vnFVay69/2tY/+Wo+3btMZBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkcLK1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8B/KrnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkcLK1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8B/KrnB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFexVH1290953
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=XkcLK1F0i/Myekyd
	nGFhkk8BmO1bbcY80BKEqctlWEV7QfwzKS1a2AnxQK7bgC0Q/0LbSLGy9mgwhZgN
	1OcnssFKD7l/i+9hCrqF5ZXM1/S8u/KiCufxmh+SDFtkUxijGINZSZLDzzq1mmrg
	fBfGSP/t8awp+teyHKZyQ/x0QOnfuzIfPTEevCuZjRVQOCHl0dXgT0OTiO3dZlwc
	bT2x7GzwMAbF8gQApTPqQwwOEGXvC0TrIXouFtyjnHdrXKfbCOpDivYIjJu2bJiU
	hZe6/sukuUGdWFYJEOJ8CyS+ej9a5aqdluDH8/hRsktlXhUFXVb+d70zkB1tiE07
	u3HilA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsghe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso22508685a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820268; x=1792425068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=d8B/KrnByBVn5yV1zSTqIQ7p8amONCliF9kuGDVDNdAVsO+1+P1xXCGw8Ipr2CYXb9
         SdfQ7U4kK+zOmfkj7bGu2fvlKZFNbJG6DFFnyfBb6q0YnOur1nq6726Q99iiVaMI2/2u
         6cTMLdQiszUVlAFuqWqbWQG7lqh68RQauNbwu2oeAByMuD56GNx7RayzMkb7Rk0UbV2w
         a1lsjp0ldaIcv/Ql6A9AOcXOdHHaD3PeBCoNcvU8jrAp72j3kyaZ2aptjMmw5l9JgKaM
         /gH3JVH9M8Flg15epi6qvL/1nelBHtmz7L36mx1cd9t4WqpsJr/QiAm3CrZEQaoNTVbR
         fVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820268; x=1792425068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=nxZHl7n0tUxtIwpKolvzLf5aNSXrEom45hPHhxbvvVEKP3kRZDQioaub9pXTa0KR1L
         I5mVL8Q0K0fI3Dnq/d3m0ejRpenLbDqf0ALlquLbWxG6IKqH6xTEdyYrVy7xiMId0kfl
         jkdL6X0kyVRc3Yae6h7tTSMs9O35XQtYjVBk8q6i3LdMXjzusWqhDWrpTHfbdY4j2EPU
         Lh1HcHSsVqfWDUusXl5QTu6x0rsvazrI5XeerpnKhWRob2ZqbVexLJiRD7SNj1rZlCnB
         L8pwFJPmrAWUTCWtbRRZCQQzS0C3CGovql9jMqq+8P7fbGGcfhMSBXymU1rLvqIwyyXt
         gHkA==
X-Forwarded-Encrypted: i=1; AKwUvBwyL8XsJ+fTMM6F8LsnUX5F2FlnvIjjN7bhRyfh3ey85/+eVSpY7mdR1n9L59fRaJjLEd75HKesE4Ub@vger.kernel.org
X-Gm-Message-State: AFq9FYIQs/PGPEhDtVuO+BtNqIbEXL2qmlk/HF8sPCxtM1FnsFvH+YN1
	RABWzxaIwPW7VVyz3qRzNuS68YxqrKwoL6sgIEz7EVLNxNqpiTJQLaTF6BO+y0tKzOQVgXvw8Dn
	cjOYMsh2FUUtgMp7H6dNmbMfiM2BDY3WJOsAR0rUZc0nWC6PQetFkZZIuCHsY+N3r
X-Gm-Gg: AYBFou31eU22VMfVkh4t3gSCtS1aavsNPnrjynuS/kMy6AJwwweTRXhm4jictvbGpv2
	Dm04mjnsWhYEmU5qHNj7k1y4omzKYNFEZX9CQblMMgAynFkuE2uP0EymWLaRgGllwDAg6veZhgs
	Bzq5vbqvWTPd8aaZG2PxCCM8EE9KMQn2WGY+vUxuTTCxUESvwFatZL9FFIePi4zQIUGjGKrUxDy
	L7g8BSDyAbzQD2eE2LG98Y54A5ge1gJozO9OHwD51a4IxewtbC85aeexp1vS2HMUSvVLyHtKiaI
	YaFUOjVTV3oP5qrl2M9UpMwAR+zMMipKV62PgAUip91vT19ywJE3JjzdZSvyLadk2efIbk2jQQ5
	bo42m91nogKAGAlGnu4CFng==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901852785a.5.1791820268045;
        Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901846685a.5.1791820267608;
        Mon, 12 Oct 2026 08:51:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:06 -0700 (PDT)
Message-ID: <5f30e6bd-3547-44d9-96d4-80acd65d5e7d@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/38] arm: dts: qcom: msm8974: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1t0w6iesOY9fFBEmbpNRaart422rbFr-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX8aCgess99T7N
 3EFOucnAFqFpPvJsp9BKkXSfYZyQC7MA5/tz+tY2vkdYmY7sHVZGbbi7lXxHr09NRvNK3QU+exy
 vIm2p3srQ5QRxZjyA83ivZiDJl2HP8w=
X-Proofpoint-ORIG-GUID: 1t0w6iesOY9fFBEmbpNRaart422rbFr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9zXHlqNJWZGb
 1x65G57sL6MAvDBBx2neDJlCzJxi7Z2+kiB1s/vzi1us0MlrKVAd5wjMRMoV4XXE8ScxId6La1R
 6bjjB12qIJsPocm9N421enpHRQwTqlzwip3FXSmDeWCzslysAaGtfCTk5HHiYdClm7Tt97KAWxn
 15bGQK2HALC3oPcn/n/ntBxPXi+7mBhk6XhMVUm3/KMWdo7mFds8OT0wOvYi6YHBhSK36nb6gRq
 d5WP9NyHEsJThMiLQCOH/KdW++tTvA/fbiTeUaqLzyOY7boE/NtsmT2PEc2YViUq7dfr8iZFlVl
 cj2KzMIq2NTP7L6+hwfxzzV6eqZiNmMLvdLnqGWKbSIlN6chiimjGiaon+JPes1J/wBvvYTeetp
 rE+L8+BKEX+BoNQWZp+aW3gAwLcgzZi68y8Ob1k6fy2v6WDbEan5wKEQWlZ1z6wCrGXVrajHiFl
 JA1aG8W2cGatPypFRfA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd01ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
