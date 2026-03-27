Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61A29AB15
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624871; cv=none; b=GkMgHsjw6dx63i9JzjHY5Z/lCzycHdAUpbvTZ5GqNXmDEEuSz+iRDaw+hluC6hxyUugI/69P5MKMGS7VCPH8zSWXVDZLNCCWdCf+W7STJXRSAfNXW7FvKuDJGO+ZTSYXWwwTddDPyhuxF0950U2VEaKAhXhFvoFHk+i1QA4UlAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624871; c=relaxed/simple;
	bh=OUkdd3FsY8pSLTu9L8PhXPFB2C77lKRWlD5dQwZEYZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTa2RFcEQuq69e7WDczfZBNN4lvNbQIYgwKwq08CPOTb75mkiozsbvLeVMGSoGmITANZ2y+YGMmX8uTqb29/y2h7P5qgu0JmbKksQFfQU81JxB+yP+LQCm/HaCQYhEI0ALobX1QKnz1zp4oDbGJgI6SmdzlKyjkTbtXCsF2nHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hh7JEq1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK5XRc5D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hh7JEq1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK5XRc5D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhIdY2769374
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8mQQxrbSpET6jZjLTO1tLAfR
	MRT0UqK3qc+kbKk98Gs=; b=hh7JEq1dEo8JpoDI7ETNXUFoNDtp3KkHbQax43uD
	3u67Dqvxrpiv4rLKckyGYEKNHFQPa2Cxk+wGN/MTymi9JWdvmupMO5NdiBOexNo5
	nmm5vj4I95xAoii1Ypw/UbIOn7OBmrnNHUt+TAuPBeQ4xQrhabfhLc9UGzo3nol0
	sl85Q+k22WuI1JbbIYpMCuOqNJAIv2bz+ZGAyAtg6CNhBBSGuExrCksBbjpPRjdq
	uXzyOW9dnu0KMW782FYNI8ALtQsNG9e/jhV28cZ/8SIm8GyegqDxptDMIkM4z1Pz
	3G+9lg4SwQ2w5vAiAWPbl1HNPGzpYulXdgKhSBwWrwHelw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv3kkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6028946eed2so3429944137.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624867; x=1775229667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mQQxrbSpET6jZjLTO1tLAfRMRT0UqK3qc+kbKk98Gs=;
        b=ZK5XRc5DDvcvnC7VVnaybukrStGVxFz/qDtMecFJGE0foIefbTpPKUMv4HYHQEd9ZD
         R37RPy6WuQ5NGUCuQCt31AZb+TIagzl1Sw+6fatKNEcYncCE/KNeIYvAkzuV4rWGkLWd
         drhS8y8grdviqq9sSSQ4a5dS4CpSC+xj9NQ7gp0bDc/rZbu0KC4+OvniccCEwJ8XKwBM
         2H5dCliygQzQHPY0dz0PagzMcvVlN3+wMzoz9DCN/gtaWlnv0utJmEwO11gTNxswEPxx
         N41BxvrBF+tD7Bt+iVWW/jB7QKyz9skOWBYmVMWx8qXaStdDzsFD8byKO1OFMHZ0eJT9
         d/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624867; x=1775229667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mQQxrbSpET6jZjLTO1tLAfRMRT0UqK3qc+kbKk98Gs=;
        b=aR/oN6aw80o9RZ74yIY3nVhqC5yxPnx6RQdXvIGYsqV9zWst65kPE1L25vVbjF2nuJ
         2waXUeDBW4QR1uGMXCW9cq6KvQHraFC9rUjoWS+mzi4LAWPC//rDDQe66vTE28rsETpr
         b6s8DrkETj34Q9cnzsiVktmKnuIMGuEGF+6nnlxefa0kBiDELWK5WtVJ3ni9085x9xdE
         g9NKYsqX/Qq7SLOXBBGKA8qfeHVisyRyx5US6cH2/812nyYPoyWnPv95uidtKr5psB1z
         I8e1QoWoEf6eFcOhvEwcORzSKdKjwB+Sx6T6uzQUsBR8g9dN/ttO6uFndYc1B+50Nhvt
         X9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVQPsOVZeBEZc+3ztINgvY9Q0FbP+yGj7WCTQBvv8nKu/5LZ6nCwQyyZtK6hzkS5+E0Si33xRf33BnV@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTxaEYBborgBTBvo5z13+YvIxMBeZJN1MpDPCMq5d+Im22ytB
	/13QS+Y3f7tUpJ4NxHdtZQRXU7x49ugkfxbqV1HuDGbsEg9YrFhe7dk7urdRYpqkTs0aWdZpmlC
	6XKNz+W11jqBZt5kxK64VNFVfWtPf5DmGRdmUce38t26Qac3mphXuaJQowWpWoM6o
X-Gm-Gg: ATEYQzzFEd9gUX0fI1zOAf3Xu+wUSwNuSLZlt+JKTyO47K7yV9Uw7/mOUuCDBjPVSrp
	hcusnBCSs/uwlMkqxYipk8cn6BIGv3zAHcuVOArtdcLZu4S18C3Lh0CNQjwX6mmCLdZCTiuU0aW
	3Kx8nVpABQOV9wzEfHK1y5ApfqDqJDIjXcqGDR84WVopxTg6KNtzQNge1mq6TimrZfxVA5LIB73
	82QmcdFSEGmY1f7FxGnZx4iOhBPGZ4JUsFMAhpJVqNSeTGcCcXITAeIXqTnKI2hzZZttupqLMn/
	DbEVnHQohwGzAkU+HhnwPU249Pxh1/wSt1TGQDAtG4FEgKD0JHVyflELgBDPVSObPyzvNj+M/lr
	KhfPLMeURZhgHfG/iATJ65KpSeDjQjahdVw==
X-Received: by 2002:a05:6102:41a8:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-604f903dc36mr1370688137.6.1774624867199;
        Fri, 27 Mar 2026 08:21:07 -0700 (PDT)
X-Received: by 2002:a05:6102:41a8:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-604f903dc36mr1370669137.6.1774624866644;
        Fri, 27 Mar 2026 08:21:06 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c8ca60sm86797115e9.7.2026.03.27.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:21:05 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:21:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
Message-ID: <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6a064 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ZWKBsS2SBI4-nGCXBLO4TwP3zQvWhDXs
X-Proofpoint-GUID: ZWKBsS2SBI4-nGCXBLO4TwP3zQvWhDXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX9putuNE/rWWb
 /XsPPGrzchwhggCgEV2wNuCJ8ZwMFith26vKU6EnRlnMSOz49YWF1S3Aj4CMJ71VT4x3MoCIFWJ
 ZJoPVH6U56d5mZUz0nAGBgMDOJC0ya5CaGo0nf232Twi+4j21pZX9a+192S/hXij8x7FXNrB2qW
 TmvblfKACNlG9o7wAODF64yAeZ7RjJu1d0PHznFSIEz8OGhe/oFVtk3WNJuRdCiOgo/sq8CWfD6
 mQf0b++4C63otWUTWpcZ2D6Vs3blOakjxqSaZYSgcyq6jp72cj4iPrRbZDDgJIai4Fhcwm5jQtD
 jEn0EbO3F8PSUkCLkz9LxYfyPNUj2tgMz2ogIChxui902+WTwJQ9sRKwIo7N+LAwWbZdv24wOui
 ozQRlNQI7VhaqQgrLWFBFEsNw5MR8nEsmi5tqkua/8gLxR+4WjXdNdJYMFsxLP5j42q7yp/kpDr
 OoBMZxEt8pSpkSaMBmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

On 26-03-27 16:53:17, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>

Hopefully, there is a DT binding schema update that goes with this...

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
