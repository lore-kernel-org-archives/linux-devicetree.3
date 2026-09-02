Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C684AA407
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366564; cv=none; b=cSoSWhuNZcUneUNcGI4XJb7PHvY7aO+d46qFob5htmpKr/AkYqbs7Bgp8+9MFhFdWupK5nQrNBH/Lx95Cp4dNzOpTCD6i8XTb8ffYMk7Btah0mz0v2wy9L/5iy1nu6bU5dPafhnh/hrnA8dUe8AQC4+X3kFMXJSAK9k+/jpuUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366564; c=relaxed/simple;
	bh=luh4teeQPSLSUW8wkyYCaLhLIlArZrUknV8NXXIvPms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPYqimIkpNpr+ZaKQ/2DXEGqkSWl/lNyi85+ZG4H3hdt6mYEKoNoLe3564K7X3kvQJ4ToEnZWHTZhrvuqd8mxKaBaDIg0sSXLwF2Am98z5+lXtEgNjsoqJysNPeunaJLyjW1P5R7L1L2NYjttUVRo/hoRPn4FQNRQi9U+27l/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl/hLpzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXTuGhZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl/hLpzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXTuGhZk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZVI1770158
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psxdpurWpkgFjDpkqxylOGiQxg7D00TqTQu52gjloKs=; b=dl/hLpzbb9GfI8AQ
	O6ImDKSl0p82F9aO6HT7ADQj57ywsGx7rvHiLSu1xm7IU1ahR0ZvMrWlA8rQGa11
	6Ri9KBy88xB6q/LF+rMijSLNviUsLdMn0mrr3HMWXANOaQbbV61vxHqoJMf9sVXA
	Zj0xGY3wC/RXGe1IIRqPEoGJdNOw67/f69s5LzkgQ0qIdSYjgeiBRbCTiJ2qGpQm
	gIEy3Bm6kUElDFz0ejjlb7Ptn2otzHr3lnI8m3btWk3bvlyYYCE7EN5zEEC00a1b
	dvYHEmbcGzf7dprkLNsgZeTKS694/j9CcWLbBonL/sZCiSl6PtpJUzPjtNIZ0wE8
	ua5SWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0r33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:29:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so34181085a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366561; x=1788971361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psxdpurWpkgFjDpkqxylOGiQxg7D00TqTQu52gjloKs=;
        b=LXTuGhZk/TA9K7RuizkfJ918+UMtTlRolsCFmyIwTfEGaP9Qyq2wjGZX1IbaQ9Yg7v
         3bathWnSG3ky5A0d337HKAPqSr49AdU5WoQ5kQpxIN96bpV5OaHjTKRpnhC4HKCxvoEe
         zZuX5ROjz8nB0zef9cKrgkBZq2Or8ov2bLNNqkmUXu37g0XfvmD59Lv11A1CgTQ1y7e1
         2OeE4ky+YKg9GSObEQ5eILVnhQ047qz4VqOcjc31fPm+PT+zTpAgYuEed0fqAQOOwkJq
         qtFkmxPUzIHMIlm94aFyGGF99fwjyn+VRARTp7aQc8BWjcboBIRGj4jwaPGQKjZeNsF1
         c75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366561; x=1788971361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psxdpurWpkgFjDpkqxylOGiQxg7D00TqTQu52gjloKs=;
        b=OEvfM7gqiYU1blsxU/u0kYn/0NoZF8sqbuJcNcUGpeLT3Y4c9DoY0X32JfImAKqTxj
         gzVdT1OoKXWUWZ/1esrWavHFjDM3wKN63GhQWcty73x0BnOueJQS2mSHHmdF1PAMbqUJ
         KD1bkG6uRQFIPkTwY/rAxdVvl2hhVHPC7h/ww+M0LJ3bDl9js2m8MBQz2l3bokEEbwhu
         sYhJWrVc+65rCOZ/Qof72Tuuy7onIpwBE6oNqwM2BqhNNUmjLagTr6Ly4996KuliV88t
         /G5ikLqLAIkOc77qmerorLl9YNARG6e7VnNCyS7XMhWDfeAroE1kCz/yc0QsmjWGHJLd
         hLRA==
X-Forwarded-Encrypted: i=1; AHgh+RomLazFaV6d+1z5B7ekhTJd6qydIvirX+hfd/odXcgw0nYf6D22955txBJxEPUu3jlC9eks4np75ZyU@vger.kernel.org
X-Gm-Message-State: AFuF++lGLVQn0kTVtgk8gakQfp1JD348e/DhUXEQo5yCgS7g/cDWq3wL
	Gfz2uYe8KpLvUZzLQx2uzmlhG7NPtIXuesxshiUjkmD1qzCFLOaeOQ5ysHt/gR85zYe1Lpi2R3u
	+hrkUt4eQUpHlbswjWGlA7gnioUAL9z39YaZOtdi9ix1gozXapErdjw9Biid4m5hV
X-Gm-Gg: AR+sD10LKGPO+TH8q9F82KuMWthCRf1BkKXFMqi5uBbHW1+o8R2vzv4na2Slu7jy8Ep
	4hKRemg8/zMkaRnpUksUJE4E+aJVq5R5xtKmjwUUj51bvkIxiK8Q3lwJ3wM12ai3n2RJquNpLkV
	oCVSx2ImiPJ5811f6Op9ct3asgNjWBRFLCIIiBNh+U/sp8v9Bg+8ua3ZgsO8WIfx+5Ag6q+8qhV
	VD5H6xO+QpC2RowTnQqWkH4OleF86hdIvMDNCbnXU0U9gG5O1o/nu8/A2gHEv7NZq9OJPt2gFSy
	14isubdQ0lChIC3HX4sXi4GH8+UiKhvD1tqaEFduN0RE6CiC6+FDFDfyU7WC14OnW+l1ve/MRoL
	rStWFgnVqglTyoAJ3FS8Nsw==
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr454837385a.5.1788366561057;
        Wed, 02 Sep 2026 09:29:21 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr454831785a.5.1788366560509;
        Wed, 02 Sep 2026 09:29:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1381521a12.4.2026.09.02.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:29:18 -0700 (PDT)
Message-ID: <4b1eed7a-a2f0-4d64-b6cc-e30b8f48d315@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:29:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 1/2] arm64: dts: qcom: lemans-evk: Move SD card
 support to overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
 <20260826113206.488991-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826113206.488991-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 84CcBX0Fr-54ae0XcSg_CIhpP3cQMZ5I
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a984ee2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ebZJyo7wKO-bphQtCpMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX9mmpshs7NsUe
 QK+VhVZcZOc5O+SxPQk6sNp2A9S0hnIg241cUMTETgG7YHYYyA+VH5CSOmVRz/Oz6F7y/0+ovQc
 kGmCVXcOON8H7mSCduF0/tWdc1scHow=
X-Proofpoint-ORIG-GUID: 84CcBX0Fr-54ae0XcSg_CIhpP3cQMZ5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX8dpFHBVjXm1g
 8Y9g4A9OsSvrEb5g0lqs2Fe6zdpuLJZoNhY67DZdF7pue39IptU50/Ewpqj0VZRnuhE+ob62Y/+
 n6Nyg8m0FB9FnrzFzNA1xqM0hGD4aKLd2l8v38nYuShqtKCHRjSFHlfK/5Ugf0uFCmcteFKtJ0+
 v08oPnuKbub6+ru709gA39N6Uxts6MwnXP9puKcGgddKRVCUK+vbh2BsFi4qdHqTrruNYo8PeZ0
 B9Qj5RnkwNANNfXw1Dkcc+6C1xDLbVES75wHpdKHZW0gidUnqS4hFxtUkKxTIshi6LgVuyp+jWM
 xhKHxxHVzHRCx7zRk8IvsQc5EZo/9u9DHWk7Sejktbg1gSzE3Gd/absGaEXL03WDczFGgCfK/p+
 p/EnLvzWn5kRk9wZgMS32ajWrmTP9dxpoYorhzfW0ghkmnFJHjYxg0FLIpwjVN5kOM1Xhplu2Xn
 qL5cCj22xshbJuM03Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:32 PM, Monish Chunara wrote:
> The lemans EVK board supports either eMMC or SD-card, but only one can
> be active at a time.
> 
> Move the SDHC node for SD card into a dedicated device tree overlay.
> This decoupling allows the storage medium to be selected dynamically by
> applying the appropriate overlay for either SD card or eMMC support.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
