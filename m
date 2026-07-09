Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D9532B13F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606042; cv=none; b=q42WAsI9B97EA39Bwt+35cONr34apYZ4Dj9lXkZ7neIeb5Jv87YTau9QUrIGSMnwPNbOQG30pQymJoGddereCWe7mZ0MG0298G90ty8/WJqRnS12RmOi9zEtyTXZ3Cxtcvz/c/IVDPHB/UGvM4i7eQkldFrGSNAK2lmWyp2FAOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606042; c=relaxed/simple;
	bh=fWELxgqBDTV6UIy0DqvW2BAFG6PSmXOlOgJYCkZcs/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlQD5YAsfzmWXrdz4LEcm0l56dMR50y/3BVeiBER2vSGULIXjC8rntmAdvP+F5ZFQ+lPzpM3rxwtbA3Q8tN9jbW9NBd1tJuwncKLEtBk+Wed8sId2AwZFqDdAT+x9TTSzfmLlsEBpIdRmi0L3pXVR8rtectMd7yF8zDTICLG6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5hEGG3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ4kVR4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5hEGG3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ4kVR4N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw1911883875
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 14:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=exj1OkBLX7/QojjHNAo08NMH
	7mpLGfvzHV7yrAUqtY8=; b=N5hEGG3fdfcAwydzW4SZux4bNew3BjX8v+/fDKPY
	8fqfeLhkKvYlbP4qtkNa3BUENt3SW5q3z07j/mfl8l6+NIKCvPk8qdYvTwFzs5Hv
	/M6J9nQ62KRY6GJftvTdXB33j/vPbA9UolskL3wAl9qR9h371pBs0nvUBJhJTOko
	YLHcOEB3xGr8CCmKPc1XAC6sCY4TjeXNyhIB5TqboyIT93sVZKzD0EVa2CPpAmS7
	D3GtFFuVgHUmjCTLClUEZVi4mT3bJ3o4Ffhv4QJBj4OCiElNPDn5i3aIfbIUT/Sf
	W4DKwR6r/jOSjskDEy42dv/uLprShpmqqFG5LmrQ+Klkaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydu320-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 14:07:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so14020911cf.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606039; x=1784210839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exj1OkBLX7/QojjHNAo08NMH7mpLGfvzHV7yrAUqtY8=;
        b=hQ4kVR4NPgPds7xRqnuH174AwQTp7a7OmhaXVSd1rIawACFBpa/7oPaaQJ0Opk6fBl
         f8+p1l8YiZe/cfUFreNd+kwTENZeNisc+CAbJ4U1rm9XHWVWdPo5fUl/eFAgvfEiXARo
         jIcDGeqd+5v/hu2yMGB5VlwUEtIcyJARsywNAfVQ7rJo/WEcWRDlLM3kOck57uCXOeXO
         mGkEyMW5CrY5ofdLeMbRo0PJ6AHrZy0zAuf8B0RisgPBLZzFDOSncVYIQMcCzYgi9bwI
         scS1JcdNw+j76b8Rhou10cSWo6MGx7ouuiS38roWszHTX5NEDjporQTUPHsIy/1D0QdA
         10rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606039; x=1784210839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exj1OkBLX7/QojjHNAo08NMH7mpLGfvzHV7yrAUqtY8=;
        b=GQ/tyPz5fwVCz84J21qVPO0a5UtiuDcqNozW5uGH/hpcRrM1IrKdD475VSa8S+SumS
         StCbJE6CX+X/qR0ZFOJvQYYJiB21VVuGprPABDvwCvLe1Y1zcrPgodgvN3ebt5qXUck1
         Rg6918VLW7Cx+qqj/bb3pfAm6snij98mIJlxzMwXC/ZdOIb0RzFHQKQbGkWUkovXLxzU
         Jl0LfbzEg+HDa8sE7oyFh6MNuVbkoP7rLCaWsuWvvs1ERClapKV+EKHni/srF6LlNgPh
         xexxfea6gVkOFtuhVQ6FONp6HLTt1S3zeRf4gpHfyW6Ko3ybTalchBvMQstnDZdlAKnu
         Zxxg==
X-Forwarded-Encrypted: i=1; AHgh+RoUKYG064/DqyRi0u+xqXsmEpyUGRY36J8sc2ZJg25L84P10RPwP1tY2Yg1Vzu9bwJaTCJPcNSXiLf9@vger.kernel.org
X-Gm-Message-State: AOJu0YzhwyFcYMr6p3ormdNJNEdvCMBCsdO07kKMqyM8rYrzWRtUXbAj
	Rs2folaPL7J/AkqBVmg6Aspn7SvR0XR/6ExPf+uIonWerz5PyEXCDpUBYwGw6Oq8Fv9UlcsBaen
	pF+yYBqjjTVhhxniRnjZf/z5TbrPokoapsBdf7e3JqmQeWeWvwjnkUXn8K+mgQniz
X-Gm-Gg: AfdE7clS7wR5voXl3AyTOJKj8jxdbcIHtXKWHIklD9B85g7hvWqNKWYKoJ2PVU6vEyT
	KPsjbWacTYTO8/PKkaemsvY30/gw+xCjdqXsMfyvrlKXKvB3r7pCM7lHE32jQ6FwmZno5+3P7Np
	YMtNZXHInktmt9th+3PMSO2KMmfbRQtx07yC11vWi78U9CFMpslev6ETU/AlPmcyvchRVL3s9+N
	HJGoRx5vqwwEbjDYGkXn4Bk0+9VcapHo+oE5ZVHrw7uItOsiP0eLNEc1oCSmkqApejdPdkCa1pQ
	qbEIPH3jQvurErm60TDeUhgRq6/sEnN51AXoIm2JGpdA9TbAV8Hx75t3o9OGj+2v8GvHXLQEj68
	RjYDAXCyFY/hquRI4exiLrA==
X-Received: by 2002:ac8:5f89:0:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51c8b4d5a86mr74945961cf.57.1783606039032;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51c8b4d5a86mr74944871cf.57.1783606038297;
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb705e22sm51620965e9.6.2026.07.09.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:07:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:07:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
Message-ID: <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
 <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX03LYXK8Yhjcu
 DNqoeE91SMb48BJWsorOzxFvrB8Q/8yRBj2akbTUrv3QqXwdd50TqyA/ZESmUIpLOzhfPFUMrJR
 dz1V96ljaGNj1e0YD5BKe61R7RfTNas=
X-Proofpoint-ORIG-GUID: _5napSXsSonL1mRVHLxymMCv16vQo3UL
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fab18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vxGFvYnQpFAaycP-2XAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _5napSXsSonL1mRVHLxymMCv16vQo3UL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX3J4WVTdtfKUv
 GWhL46rvBAq6jjvE/Y9BVkZk0xFLrEeU/pmH54k3cBxoTFrA9fPwIKdScaAWEEnhe5CVXYa1L46
 oyAbweX2YoliN0yeJtIK4Mq5gy7JwmpKrc2DdGP/97/0XPHaKlvmGGvsmhyJN7RM2CYdNqZnPrf
 Cq+rp818C0ADTRcJVhgi7xrEfwpXrfwgQwVgVwyRDhRbA4+TCBJQIYwDZfs2BQD3uJXVO2dD3xl
 cvIuTpJMrNacFDApeCrRMnhKuGkqFtxJ/tdd+2aeNXBYURq+Amm4ujRZ0pKGtczgHTDi0eAdgd/
 cY4V/QkWy24VlX0B261MDi4PHxsvJtcA5/Sj+BsE97YnIX98/4iztOt56G7fcVAS3x/okAg7oVy
 1DQmN2RBlSUeGQ7a6dI7GKa6Zl4BeQHWqLV0qxBrObKtSrQuse1Zl/7inzTVFqik579zETIwdtn
 wQ2oxXYcKHPq0CEfC4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090137

On 26-07-09 15:08:09, Konrad Dybcio wrote:
> On 7/9/26 11:12 AM, Abel Vesa wrote:
> > Since each serial engine will be enabled as needed in each board dts,
> > there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> > 
> > So enable it by default. This is also now in line with the other SoCs, and
> > also with the second QUPv3 wrapper.
> > 
> > Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Go ahead and enable both QUP wrappers and both DMA controllers,
> a subset of both is assigned to HLOS by default by the tz config

But the other QUP and both DMA controllers are already enabled by
default.
