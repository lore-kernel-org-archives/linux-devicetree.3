Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508757;
	b=Ik7JmHIXTbfsfPsqEunU87hgs1eA4dIqlx3U+rU9GkxE4oGEKHgChjgALxPFOC1fuGtK
	 fo9wau4C1IUasbhNOta11lhTkIwySNVoo9HaJ/FrsI6pu9/N76Vds2UIuXKr5tjG82/qe
	 3WCMuuNpVmYHoYA1Oj4iG3Fi1HNHgkRHNk3ypXBj90vMHhdE+Hig25iEiisXbytvQvoyt
	 9HDKgR6nOkNSVY302kRzZIN9GdVQ0BkPYcaP9omlv0Uerf+Y3pWwJc1Q0YFGMKlFi7DCM
	 qcl/Wjq+w2H7sOlwX254G2scKeVdbegT1C7lQWpgsZspoZzLXY7NJdL7E5LvrYj4pqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
	b=QLcCksdHpmdALjp889CAedrj4JGV/5J9GFOOnxYJVL9qFCLTUd+dZKXazGpd0LP/kfAI
	 3sCXLh8HAMzF9qiagnz6YjJWn+rsdRsTiDCPfGdH/uD8t5yLB90vsVKc/V0z4gLwqltah
	 /sOv8ZzFVEZ67gNCoDqpLAH80T9NvlYS+AAW48Rbq8tmmkirwniDuJ5DoIOMERuocRSGH
	 p1LY09zedsCYo2CCvAyn3pTq0TWrRSRS9q6bQw5nTE0BeA3q4opWnVNuP+G4vBGezvOzF
	 96t4m6fD2NjvW1mW3xsSDPFgoNVruONIXt+nYL+VKYgh30kMI3NdiE97xeqwMhXjBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540F606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E540F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8L11r4128993
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=; b=gc0jjAbAvL/zSslc
	utmB9/45kGAqVWnWEKLkVkANHSp+F/eDR8HDF47GBRhaa6P/Zlo1knyDckAZtx22
	gLFb6QV08z31iLEtSn8/muvnyj5dAvb3vX+oFkBNNdxLCK+QD4izuZ3tz7lD2A55
	qK1bzWfhLRyQuv1q1/wSIFzU003NDgzv0bsruifBYaXx00dM27jWQSBO+9sSG/eB
	Tit7+yPMmOQJvFikdlizr0bj5OXy7LKXjGifGlumL5cCj9sNVkw2iziPMWddiQHG
	JurgFCfgXaVyV4RVkURw51ofjxSgMHaqXayXPect3KxNuZyGwhJO+K4Q1zDa3lbR
	6sAo2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt1mhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3273252b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508755; x=1796113555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=HkCMqgTPTpd8uWgqkNr6g/4dDJc6GOtZaHQhGKJwC1xfwaSJ+M6l5+yBJ++SbuGtCj
         jQRA0TlFWSflIc+CsQ+UZTxYaqJNeqtqxD8yD+tfW9BBn/dL1zoBGnYqdPpnTUBto4Ol
         gmJADUgZk8zfOELRCDWCYD1sbxLkw743YPUYCMunThFYnNfQ+cXY5juC+63JGQWotO3u
         PmK38Pku8tVqTvH/ja4eHPzV370XdCV29USAY6kTcLwcu591CuSj/se0BKFbmGTDnBzw
         p6S9uf78mIOKgbU+kdGxUJD/Qa82NlwjpPsbmnuvBYZ7jVTjsnsqx1ufvXyB1xABjjaI
         cFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508755; x=1796113555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=K8IXcAua6Ju4vAm82rKs7EYPdydgSe0Zu1bSBV3w5TjYIijTyVOlgK3Z8iAlMeuyPp
         89ztzcgq8cZyyFd29VY5SyefwlWRRa1Tx94focJcpXGlutZgrbfTotTWBRJgGSqQOimK
         yPc86mrDFXcUPSi0VHSiBp7qRAB1n545wfUr4JyqTOT82qnyZ6Y0ln7UOw6TXdz8/9vj
         6hvMRIEOFWNaneVewe/ZFQ+m8Tr+hzrj1QqCNwYlgbAk4TOF9QRrAOREO90/p3hwHXf/
         yeomFSzfG2UdNDv+pDKLKGDQAJsxEkX5qnROIhIPIatI4C+XKyuZtIe/W58QYtsAQI0I
         DZ3A==
X-Forwarded-Encrypted: i=1; AL+hErHU50g5a16X48FfCHaJqaK59G8Dg6Z1aJDmoBtJnMqQC9kp4b6AQ1EJyl5/K0k9Cst9dLaXSlYCQTGf@vger.kernel.org
X-Gm-Message-State: APuU4Z9aQ5f3zsFjOdq2/YrYMZQ+LhPjdmPV9fHy+yGr0PkgJ9t9hxRE
	QHhpZyou2dHiwyf7k+UhVkNH4zTz9FtsoV3MU2CVv+zFcEOAYJJ3dIuQKqGhnuBGy6fyblTnonc
	R0Ty2V58sluuaefONk3NLzQLuMxWG6xVR6TIykb+g7p69IpTsVP6UVHNyuzvYsUcU
X-Gm-Gg: AZFdTZdePo4QyEBMq6s0tzisNf/tKwa7ER5Yt1VEF0RZFzThBovzNzsHeWXWVFa6Q/J
	AK+ppDmquRa4nnvhS7/5X0TUFy95FFhKvDw7GNgRn73GKSZz4WROk0hOE8j9WAUkuuS/shpX8zY
	QEZcUKoUNbVR5SMmG1IswpBf73oBUhEz5/C2eRDiXc2xLIrgPWQHYqZlYvCST9HoaVO8WIDoyJu
	ipXoVNjI7H4NDlc3oDsFzLviOunnRXvXRz93qlGGCB9VGS7wqSLtouITTPfi4YsQX0UJqywGWdv
	kEVWgzm+vVK8pmoXt+K2OTRkUke7Uu5phY7IxcW5A8wtzCmoWcDX4D1QrF3+kACxNkR+rM5PDjB
	but/+tpXfacHiU6y3iouyzwL0HaZn1jynCP21AzJbTAwNMEIEirog49qd936cl9JfUrLdWugo9g
	VMcFE=
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143586b3a.16.1795508755352;
        Tue, 24 Nov 2026 00:25:55 -0800 (PST)
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143555b3a.16.1795508754869;
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm7129262b3a.36.2026.11.24.00.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Message-ID: <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:55:47 +0530
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
Subject: Re: [PATCH v3 0/2] Shikra: Fix qce configuration
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX8NuAMhfutZvD
 TsTH9an6hpyIAK1xOW3JDcHgP+xQI344pkmDJPvFhS9AmvyeUMln4qm6F2zuvNp0rQn7DfV3ieE
 vkHUtzv8sq9ZHlt0e5sJqk8Ceqbz4mw=
X-Proofpoint-GUID: yIbJLmoL5o3PZx2tCkgIy_DVImHGy7E8
X-Proofpoint-ORIG-GUID: yIbJLmoL5o3PZx2tCkgIy_DVImHGy7E8
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b054a14 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4cre8Lmcb22TJlfxBc4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX7xTD7az9xQr6
 MgiG0/Oqwf1GIiCjjhkHnnfcw7vogwIvPouLj2rnPzthjU45rfC3KZZhorG6ECxN8GEne/iz1cF
 pNrssgaFPPKiZwiH6H9028RlChWrWKklAVXErif29zb6EgatXFTpTV6vY81IgsDrWkDXHzRFK2t
 FI7KtUQjQ+FaRgg7L8qW3AlsMKUXZLFNz4ZBxv0HgQNGrzvOCaKw68vL0MdQR99OC4aH15mo5hl
 vsjHXyyXi+BE+MWh+YOcHtWOsPT6qHy2D6d/LXqNg8qpUctMJqoi5zghN8YfDhit/J2vbVHUz0z
 OEXoSVBQlwR8L6DjczjKc73tNFLEFxRMFHuNMoiP2VYpolKE54kmvVsXlPL+wHWIqRvUlM6D/a6
 5H2e+Cj2dft2cwtN+QtoIm5s53vm4Tt9HpQS/vcXkwU57AiiPBqOv1yvMvWTjZO5tFd+2gi0Yz4
 fdKZi74qPFqr1bQrovA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032

On 16-11-2026 14:29, Kuldeep Singh wrote:
> Herbert/Bjorn,
> This patch series fixes QCE on Shikra and targetted for v7.4.
> Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
> in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
> backward compatibility.
> This series updates shikra fallback compatible and hence, both patches
> should go from same tree to pass make dtbs_check otherwise patches from
> individual tree will break dtbs_check checker. If dtbs_checker is not
> blocker, then patches can go from individual tree.
> 
> Bjorn, will you be able to pick both?
> 
> The patch series fix description as follows:
> Shikra require explicit clock which is omitted with current binding
> description.
> Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
> voting and crypto was consuming it. With proxy vote removal, qce need to
> vote for it's own clocks explicitly which is already being done for
> agatti target. Adapt same mechanism to Shikra QCE too.
> 
> Validations:
> - Qce probe and kcapi_convenience.sh tests.
> - Correct clk_summary output as prepare_count and enable_count are 0.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Hi Bjorn/Konrad, Can you please review and comment for this series?
It's important for QCE to vote for it's own clocks as dropping proxy
clock voting(patch in review) will result in QCE issues further.
This series fixes that.

-- 
Regards
Kuldeep

