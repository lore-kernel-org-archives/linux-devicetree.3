Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C58844161B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770963; cv=none; b=Gj7iDS1aTN/AS069tuMsamw710Fra0xxzWgjNnx3clp15hQj5RG4/jjS6jQrtyeT8F9mqTFoGwuXleUtwt1p+ZH7ml8cnjGiFQsIMqTQJVKBxmKDGpSmx84/e3ZmsE+rfIKtbw+62Mf1i69Z4p0bJmjFDPbjzofWU2bxqCtAKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770963; c=relaxed/simple;
	bh=OrSdW0cwhgNd4LjbyiMrxcWjoLDm5czxoDQHAXez5Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KC9bdCkNR8TPRkbgn2HTOOnEMT8joUDme0AnXQ73nfNoQuarpuyA1dHtvVzZBBCPs/2251LoBpj1dKOgLruEF81nZcvFO9vMuKfu7qkm2VS0Cyc67FqRmJKBd1Z+3LbdL3NCvGK03W57WnBhUojmKwXQOnW3jM/egkm6Ecz9StI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHb//XwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCwrWnvn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHb//XwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCwrWnvn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cxf2146224
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=; b=BHb//XwMAO8UsV/8
	IYn1mz8wsaUlcJrTcOBpyMdxcGrocww8V0hQN1njhOE37Qx4JdGsiyyRJKVwV09a
	6/IqSTrH8bTgJrhN4BFHetcG7EhWbr87CTKbrkKn11fCK+wB/MHsPHAJNOiDcSFq
	O/aEEg1ZcCpMR5yrdIOUnPWaA7P/NfioCcCeGIUhEc42BgJf0sSkv1Wf85JpKVSS
	A2QGkgGKStD11uLesxZ04E7pHLodxHXAzE4sKaeXpl08fhwyieTirJh3cfYzios0
	8bAdOheWqv/utnA5MKTEbtJfGwDBbkLJ16l65f6Mp7+WmV0yQZzky4Dxaio064MR
	dVu4ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdx8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:49:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so4707841cf.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770960; x=1789375760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=;
        b=LCwrWnvnkpKe0K72QYI5zeHZ/YpuY5y/FF/Nx8iIYJzMcpgdXA3YJdiq2maTEn7e1D
         Or8imGdflATBCEOLsz5Ls8QfjWEYS/e9KyHK50t0YWZTc1vgSZ9shdaJwZYKiIzeqjt5
         pwKzij6TtsBkIFatp+qEWhh5yg5DV1t+t8QSI911KDUOdKJ3Q+N462fxeiZj1is/mSUJ
         //NR/upLUfMiAtHQkhrDuaedCQ++luLZH+Eamd+vT0JtD+2ZTtO8j8ePdiKiqEZjPChH
         5y4fw46YUZS3b5IL1rkKHiCd8nkEIVD11joQitO59xoPUym0NP2SjhY4vHU5TqqyTNWX
         8wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770960; x=1789375760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=;
        b=YBxdtlypHeSW6W2+k3nbvJLonMddVFtV5GCH9rIAceNRvNLCEHUNlk77qRv+6az1yB
         uQ+wqXqJQO8S19gzSTCle682ezb3ijxPg9jnufw6oFx03qozm8v26k9yUdCnBnZv+eFr
         +twN9wjMXXpZrSmlhJ2ycuLj0a9RAiZObzyfddWn2ahxT4fna0tvE9L9a+wl+NrNtvXM
         3nXN86Cu+4GWPBckcj2P13t6OwOtMbvj0wKLC499QzwjHgG44jcRPI4/kAMWHEUlwc/v
         8DXE5r+foWZqlAXYsul27xc/Kw7Dxsd6A4LG8WDZ0j7a4fmPPqte1B+ifK3vfI0v1low
         NxOg==
X-Forwarded-Encrypted: i=1; AKwUvBwyMkRm3b6+pkFfgAoo14Sodk3s1Kmz0MPBi+GkCYo07Q5mm3lFNj+tH8uMCwB+s3quGSzYZ6HuYgH6@vger.kernel.org
X-Gm-Message-State: AFuF++mQWLYurA3VHLxnpDFi2vyTGoHMmU4jh+UF52Tvr7wlBtogRoez
	796zU2xcZWEI7vXMSpOxvtZGt83JvoM8eaDw7Duf0twi4+t+yGLZQhvpmacCepF9lZezqtJdhuE
	liwi9NYGZUyVPksBjym5IeggdUIcgfk8jMfcKOwNMSXQTKDokyx9Sj7u+KK6jcStk
X-Gm-Gg: AYBFou0QvbKPEfo0g3H/YafTDMCPkY5Hz9syQfHX+dW04yJx9eLYv8kAh6iKDe8KjVX
	fzotPppC2ILTQc/qK0blB9THVkXNue2xuE3IntCY2SY8THobbICTjacjdTEl4mRvfj1oAn9qmXO
	dFRp9v0Eo84gqkKVcN2prw4CEopQAoAlgl48s3Y9s+eDNAlNQ4u5mjwMg1SJlFXxpdAhldwSSPN
	Etz5PeHYR2Py3C6YnLUOUoKe3FKQmwq5pQ0AWUIxSPpYg45NV8Jf6Uji66/VjjDOkwICei5T1CC
	udbRzyHS9CAUePZMZycs65xOMfzbU3mN4ABhnE4LguUX/FnjriS3OvrAPNrrB0uRy9pcnKkKhMj
	QnRqVrTUowoxsi/mJTrgFSA==
X-Received: by 2002:a05:620a:218f:b0:939:9d7d:1928 with SMTP id af79cd13be357-9399d7d19b2mr545614485a.3.1788770960473;
        Mon, 07 Sep 2026 01:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:218f:b0:939:9d7d:1928 with SMTP id af79cd13be357-9399d7d19b2mr545612685a.3.1788770960022;
        Mon, 07 Sep 2026 01:49:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca88fsm270502966b.17.2026.09.07.01.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:19 -0700 (PDT)
Message-ID: <ce951267-5872-439a-96ab-93d45162d498@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZiO6-MWZd_Cv7YdQfxzsVPbwhnWW5Um5
X-Proofpoint-ORIG-GUID: ZiO6-MWZd_Cv7YdQfxzsVPbwhnWW5Um5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfXwnfmjBM3sinI
 c9i7wdLCYR1bqL6AHcVTB8324fRXNsne+K0NiS9+twJrJ8gwpcFNftmdtzBPQ8CfOOjGVNqcTYM
 ZJFE3RLPeWHLMXoEjIOGUNmMSPH5o4/cV11vX4+qTfPfjG92M5NFhgwsFGHBz6aw56VHJds8zJh
 usUmKaI/JUivXCPTsRQw1cWv2Da5mVEQkKbCmW9kfrXWk/GhxDhDgB1UZnNfnlhICRPuwAQagMw
 m/YG1l38VoAFuz3kSPMCWO9asiZCyOQBag7V+CREsTBuRXAaY6vzyVa35IYss0h9b7i8zTrPYdi
 mQ4nabZqSciR12UkXBS8zk4HYZtUXN8caZWEEwSdiZf+cdm+SyfbBSxV94IHn4yJBXfil7zMhO7
 cIodquCSu5bfaNWiv3d8UQ+AEqAcbWA643dr3HSiT85MUh5wbSGTl7PEkVkyZCVHnGZfgOoAM4y
 3HO4gqCMRc0lt7s8Keg==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e7a91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=xFBEpEO1I9XzTPArvIcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX5Y2PWyfbWAGY
 DzABDuyprCSCeF2q9MyKO90ROYKH6FdlkzbfKplCFlVy6RLV8Wm0pkDbQUebw2GfnEEN1+fY2Li
 1I9An6NnfWkm35/tfn1IGAf7cmvvhBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add the Purwa SKU of the Lenovo IdeaCentre Mini 01Q8X10. The chassis is
> the common x1-lenovo-ideacentre-mini-01q8x10DTSI; this file supplies the
> Purwa SoC include, firmware paths, and the PMC8380_6 nodes that are
> absent on this board.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
