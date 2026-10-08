Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267E47F793
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450546; cv=none; b=EYNqzRVHd0bmfDNBWr9uOzaIMRsdfw65W41p8ldTlsb4S95zwExAy1EDKPp1/5ojcgen/jCCsSBweVJa2b9dhAdhmIN6Hyr6rngt6eTLJskfRQLV4lk79lGnuuYCRcC125ch/B3byrPZ6WjnedY3xxkAXxpWIaQif4nyLHH+O3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450546; c=relaxed/simple;
	bh=codICaEdp0qYugty23BI46Y/NC2M9dOLtRVF9r6NWNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/sdtRa9YkVN4W0MJdBvD6H8lfhR+GDk+sewcMCSb9Ikj3HY/nGEA669zmWSewx8OMiXcvUcDrhq+c06xZcyK+Pr8QssXoawVCG7r75mCBtTUAx9Z+P0wituslXfR9/SSOmuvuLKw38AM4bh+eCa5Tge7PXN71sNUpVV5gW8Gx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SB6V9DkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSX5BFLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB6V9DkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSX5BFLc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KA6W1574590
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=; b=SB6V9DkYAoSFiEaf
	fgi9NqFxXXY+wTMtMzHKk8MNnMufQPEpAR90ZOaDBQeamxYmXG2w2e6YEy5GM4h+
	v27UYJcEECTBBfU3W4+N3JKSpDtLZFD6vpHkNikWazK20QD7BTjWk2gO5zq5Xg+n
	gXj2K13JFwidSCb4C9OPpZjasy5w9P1vn3SfhBntHtzFOMuAy2g+caNH30UbUouu
	7/w2tKA/m4hZtEXkMfM8wG6LtFqzpfkK7xR6bTatw41NRYwQVnO4pLpSsemBSpO2
	qH10h5cPhXhxYs9dtGu7Uu945ODBhxDW7UyHJ3QcZH1Xxj8He3zrjZwCenEt6ffZ
	XJZgYw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe523vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:09:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510562ef98so6862014eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450539; x=1792055339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=aSX5BFLcNQGHVXxDMgeKVLARG+gS9SMO3zpzUUpsNd5eboCNXSEIFFga95Tr/ZB3eF
         RhQnuCgVQZ0oCwq2TTn6A/QK09zIHbMLvPTpB2vwiqCvqaIcrIwzsNUOAa4vdDa1qMNq
         9mYhlaL0AjKoNxKXBwOHdNe+He7V3oK6hMLBumw8qmJ6m0JYTC+/bDyxdjMEJj21Qwo2
         heDbPCUOKneSjPz2FYAdmNJLslsHiHZ8Me1uCw52VfHixoWgPNnK+gLnt68FyXfmCZaj
         l0I1Q1Y+/1XZyYFbC5qFVMgsUeb7NvxQ3ENFvONjGdju5JDy/PsvlkprEPCEo8QUKhZ9
         unmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450539; x=1792055339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=t+DgCd02YjVmmrxa28VfgG3LFpEmzBhVjg3T0A0YWPmEur+Drk7aQJpan8tapOTrQF
         g2M63jf+UnrjYO67XGoSSin97TUjRb03E0fMHgvJMnFLC+b5aopIQqq0ao8/lFJLCTBJ
         jYa/uREwR30daudd8VYSkUjnrkCQvlxjSjFjzBeqSN/40TsD4ycnnK53ptYqbfKyw5kh
         yVXnuFs7k9EtCwHN/yXh80RpZGbnaI8ztcBYMa+piPAuAtfryACQOHnTIpZr+H3pl1KC
         pnlO9HVxgkwgItPY7aGWalu8MY0L5vMxeQiZFR/Uz+ebxfVaOOpk2/k5zpUuKFCQhYyW
         19Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ270Tdh1oo3CS/LDx1XSy1NppRxgOB7X8i3g35n4siXU0GEVX6KZ4zYleB5SAMg6xhj+/nDNvy12r@vger.kernel.org
X-Gm-Message-State: AFuF++mJSYNpD4yAIOVuCt4sKmgZhuECOzEtPzqtCd3EJojubSpU3BRp
	5pohgI40LooIG8VPO/SmF97CBycuTkndcteqSEgi00BHvWRikw7krhNQwC8/pGvR8XN404kUDgJ
	Y25XIeteYWLmMqBTUEqv8h7i0kSEIhhGxxvF1Rhb/boj92dtn0y9jGrGrScSMIumO
X-Gm-Gg: AYBFou05rqKkkjcKJ/aofHQSTknXC4P5BhiX3aMSN0NIphKG2OVXCHJvkGTMAAwSSuY
	Pjjwce4d35k2CP2ihwq8MYrKBE0oCS81YEzB58L4SOchX9gSNMup0zWd8mgqncZCdXS/7Pd2cPG
	IoNmm54ouoCQKnYpSc4FvkWXWoLsEk4lbZxdCgWNp0YVK3SZEv6Uw9n5GE/5Ns+oagjWTM0h1cf
	NxEat0j9Zp7H+wrvXH/r4tRiATRrXetzkzrOo+yGmDunTIvnEZk4hQIoUOLDNYxCOmDIvXdfwu2
	AG+QuXS3UobEXH1pfrn7/xwUcImMMZixBUfWROR28FqvhiBOftzTY3byuJ7QoCiIN8G7/ScyiPl
	M+c8cvd1Ic9F34UTfCLO100ELSWc=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174613eec.11.1791450539279;
        Thu, 08 Oct 2026 02:08:59 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174578eec.11.1791450538615;
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm25647665eec.19.2026.10.08.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Message-ID: <5b895ba8-5873-4576-9abb-2130b46431ae@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:38:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gPy_muG1vZZro-QTo5erlTDdQB370D1l
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75dac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mwqT9ZDZRjcqunfB_n4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX5BfXSHLttR1r
 evjmYRl8zEGRLWrZO1LIln0rins6rESFJOYkXMDH3ezPjmtRLu4h9bR1BBsLC/cSYZl9t9YtZjs
 l0ujVlsBBF7STVzW/UYLr15W+4nYkPo=
X-Proofpoint-GUID: gPy_muG1vZZro-QTo5erlTDdQB370D1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX7y0R1zhvYk4g
 fpX/oL3Mk2gLNDGlgRBtJQ6YBkf8zDwl/xSWmb5uAlqcqJu5TD03Iajf4Q0FS1uDXAH3D8QkqpJ
 9Ag+Sy4UxAgCR7LicQ2f6J9TaD3YTaHuyJOlvgaJdnmtDO68ermcckOvZPWIGUIYulXk5bxArXB
 giIW5svZMyzYVz7sPDewQbbhHaDoJcnEqWswOAA1i6+RKrfE4cdmZiZoMx83hNp0JjYx/6/cknB
 xkdlZFVnfDnNX37Tf8Df77DJ0EwkFlvdQPlKBfVxDplUUryGR8vXLq//An67DjajL3mjK7y5qt2
 8CPa0EEsb6/aNLo4cxc7lCxHYZaZVpwbxc5uk8mlv8H+1ooDU7V4cb3DlLM5XeTCo4IJvntLuPX
 M/JKbe9O0gX7x2LZ1DSjFOiHeF4HYTIffiHyfr8ymGz+v9qdHJDChniY20VI/Scsz9DxqRD53jp
 9SgD/qQf3X5oHiVOV3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

On 10/8/2026 11:38 AM, Jie Gan wrote:
> The tpdm_dcc device cannot work properly on secure devices because its
> required clock cannot be enabled due to a hardware issue. Mark the
> node with status = "fail" to reflect this.
>
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
