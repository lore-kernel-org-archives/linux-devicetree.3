Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD13DCDBF
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165369; cv=none; b=alV9HX/h6BjSVHNKIjOXo7dVbYC7t8SEtmW8Jrm4JcYdIb4QhIfeLDSaDnWlZSPPaCwfZxl+6firulJ55qLcV1eLwt6SSaHdoEsC2szsA7/x3IefvgzvnDK9b7rT5NQQNzyNHBizTnx8qABIl/PFl0MGaH7pPYIkrVIl7MSm2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165369; c=relaxed/simple;
	bh=u0jVi31Jf3Z6nQa/VGyiyLrvdlvNeYox25V377sQJrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzZdDaMazKHtn5NUb9mIqVND88QOQGsa4Pdj1+d39Otr8k03LSCH/60HaljtQkkJ+2AbbP7vMvx6AYtWIk+6rYUIHaKxtV9dB7LVcCJitRjXjMgERCgE5OiqOiy/8MTykPdK6K4PmQknb6jD/AmP2B0Z+RIYrlMBf9L9CrBTVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRmBlSyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEqmKMow; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRmBlSyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEqmKMow"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xuVs1844241
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hX0sPWJ8taN18ULMtXvSdCNi
	0vfVrMuk2Gdm1eKY9xo=; b=CRmBlSyNwjRxBAEnzkVTIkUkTe+ubuLr2Nj2Zq9T
	tNLk6Ts6DZHw2ObZu6DUAskjmgU50n4WHhW9PZokT/XxHr2td5QyvLAKTwG1WgRW
	SRVMW6t8msXabBTeNsHL1Q5GcjOkMbULunig3Y8hbUic6ZJMAB6UTHf/wDazQIov
	DhrSPsSNuPfIm5iv0BfsBIzQtYFYJdDkm5/fCY1b8ZhU9BRkC1qrdmYZKtAUbQvH
	0pmvog5KFEUNCk0ek3+Y7cCnM0nbP7ddnla4w2gl9DulcaM1lSMz2qfUYr3wEM8s
	N4rND+AKDH47uQWKYu++JhOVOq9xSQqyzgmQIUyqfYiKNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgw9r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:36:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so457787185a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165364; x=1788770164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hX0sPWJ8taN18ULMtXvSdCNi0vfVrMuk2Gdm1eKY9xo=;
        b=kEqmKMowyN4FAWytBa0YhHA3bYR3/vbPgfBc9rP1k8RPbe/qXu6Irv7HkjWxYBtdwi
         ZyUuDLcPUUlfOlYkxPkdKtK9+6G/NZcrzIMNznlf2r8oqDYry8hsp1fbDaW96oM5++BY
         PGB8ZF5Gs/9sFENDL9GKvgL495NwKFjPP2KFPIfqlgWU+ASBNUkuoRvPpS1BcQE70oNS
         952kqI80149B3gjH42XL9Tw9Ey8g5en4q2whJAvJeZ3IkiPkAK0m1CwatHW8kqNtzfCV
         AFJRS59TYatiFvbbvWp2ZcuxYH/koBE8Wzr03Qg370wa4dwr0EY2jsAcMAPc5GfsCB3v
         1Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165364; x=1788770164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX0sPWJ8taN18ULMtXvSdCNi0vfVrMuk2Gdm1eKY9xo=;
        b=H6ttzKWNNUde8nUJRbH3qEnsaxZrkVC/1U7WMxgkdZGIhUoBqc21PR6pohTv2xJupf
         WU3eQiTcnmyNNeAgfvLR554Y6Ldp8Pszz82kPOngDo9hSRlhdvWJbwQ7FmWQY8KYRYJk
         WRCRTeDfaud+wWUXvDhu0jDzrLiQ3SIaoR9F+x09AhHotbpEG58PXeEIYayi7vwykZWm
         MgSXfhI/P2kuLlc+o7oBRARtHFNqKK7gnZn+xF2Y/sDfUQssl6sJZcDg0SwtJF7OP3iX
         aII5yR3BKHG8ID+lJnqUsnM+HOiTqhjLelSax9xVWaaJDEEJsbdSYoGGLHhSdNdwlxbY
         AAsg==
X-Forwarded-Encrypted: i=1; AHgh+RqKbsJa0k18RJi+yqOd4R83fRhmn2lSZPMWjeMrUlZ0WQJXG1Jiq6gAJA5jeI46Me7cExZwm3v5Pz7g@vger.kernel.org
X-Gm-Message-State: AFuF++nfk6mrJMQ0LdIPBPz5KDd9qdBuptwf3j/ufi1PJkFxYLzQz8zs
	lrGSXEqR0kSFyTQsAQuPCzQdQhuq7oRF0ggGiPCEBvieulmIaZ0o559c2n/HhEFTZ1KO6bVR90+
	IHYXHWRci0PGMmlN81kcqg3YLvPPJsT6TFfQ3iqzXa9JU3MUn9S0VAyO5unpe2RGp
X-Gm-Gg: AR+sD12AUPcs4nsS3mJTxLL+pfqgPU2G4P0mqnDD9CV9j6g9NJa7G2a+i0aCbhXMuGn
	hXLw/h5adGWTEv39dGFF9MPKmFOmsd8RXyZWkOBNi6JSAO/OlcUTAITnvO+xev7ovME7MVcIhaT
	XrnIuNiQprgCqkSEQeyufqhPEUNGuc/jeu2phTj9VISglHreRydCl4Ll/A26J5PiErfDcUtanfR
	yHToBhXMnYsRTBKV+5LBv+ZF/VojqfJZ7r8f1KzjzDko6kBiMa+4p5Mj5O7LVd9m6po12MA2LFk
	ZmoU5nKD558v6DqcA7NarimUbq0dxoc7W40DEKbNbMmDuDE3BBmfqvEN1bun5J50rP63gszGum7
	ZxghUxm9WoEWRaw==
X-Received: by 2002:a05:620a:2b81:b0:938:ac3e:79b0 with SMTP id af79cd13be357-939427e8ddcmr130106985a.9.1788165363976;
        Mon, 31 Aug 2026 01:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:938:ac3e:79b0 with SMTP id af79cd13be357-939427e8ddcmr130103985a.9.1788165363429;
        Mon, 31 Aug 2026 01:36:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b468009f8sm364540055e9.0.2026.08.31.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <azzutogwdednkjmlcpzml77nlfs6x6jvygk25ppz53rqvvj5r2@al4at77cwy7t>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX00F/ZtQSONSa
 1kpuKElRzLmFQVFUGZfimC9AyUgn2+Ka7y65jYFkWuTfUtAouY2G5Vz0HDi8N7NVyb4uS+2FN/8
 Xgo7VGzhmLHNsfFHLHyrcUMIhtsjxKz7L/P0yeS+dH5YwaRzoFhXfkFSCOOa9A7NdV4S3MusiSw
 dTnMW498fV9OAwa33C3AkTgGHCutCw1BFhelax52lDLR7IrQAiynP/WPiNTkyA4hoi64Wa6FrQd
 VgdUebthUjF2GdSItBRLNBruuqRj6Jpo7SNQ3F46cc5+btGHYqSPE9YwRozFihQtNFWkU3bLMBr
 Rvd37DsFrIhYSXZ+Ds1Q3XwjZjOB+UZU3rfSFzup7Lr6TmF7NzAcaIepbAC63hb69vy94U/04WN
 EEEDQ0mgulUFTjiNVvNiohuJjzKeNx8AGJW9RsCJoChU7590QiWW2lUg7/4SLVyxPJKds2nFfDZ
 mfJ0dNfPgQ5IcicU++A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX6haeEd/Nkxg/
 ofIo01ps6wusiiu3U+rcIeieac89algtw6pt7Uhb3YgeA4ie1zQNyYXIs8GkjFo84URE2chTRYy
 aiMf9sSC1+yW2ZMCuPUCXi6Yo7aflJE=
X-Proofpoint-ORIG-GUID: lLHD3TvqQO5GHwKIv6XLpEFsoNMx_C8C
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953cf5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=H3vZ0M6YDjZHjQ5XKsQA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lLHD3TvqQO5GHwKIv6XLpEFsoNMx_C8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-31 10:29:37, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
> of the WSA speakers on the WSA2 port only makes it is incompatible
> with the default SM8650 generic sound card.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
