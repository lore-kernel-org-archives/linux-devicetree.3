Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB4446C1B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516048; cv=none; b=JeMT57k6brmKtHgD+xdx9rQrbACO64CdqQe7GawSbTq2Y4ZEQ9KM7ofyBTZg1ib8+T1anZhVZebWWjfWaRd9VJRKOU1yJNUe8+Tt3YMp0hIHzezpzQ8YqBXyh+geys7OZLXd1xTMKBQJQNgOuq1OPd+IkdUU35b5mFhETLV7q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516048; c=relaxed/simple;
	bh=BSCMszIs1v1lUaezhNKG9JEUl95EoF3HTP+vL3koyoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR72vU2UF8tAmldgWoqRDHe4mRDrjE23A+Xk2Ri7dKvHA8nzk/RvN5MUMrDiNOL5X33NIGHV8U/XoLA07TRs4cXZIDxUV+bhRNcgrNKiQFOrT7eyCS8zmJHvuBZgLSIbxUngTtrrNxjMQuvGO8etAGjL1BIhwv6xiBP+6bWFncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdMyxYuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYoATRCg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdMyxYuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYoATRCg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mpVC2430019
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 10:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=; b=TdMyxYuRIOrksRiP
	knS29FFj8adntQ2yTpJ57ECIJL8bpWaG4kiZjaiAOEp8lzoFuXP7fRWUJlUWfHLK
	xDzSvF71BwZrSzXufP//3VtGFDR/5tCNOmjd8eIevT6OIScwpeuNPIpJungXRLfI
	h5Bhp5NbXZXXZkYyBbPG2eMmNesBDp+5NvNdpGyV685hj060ia8FMtWXfoInWTTR
	5Jl17HRlpb0ik8bPFI8tdMXIKd23Qso8nsiyzMEztcaWPkdDmqOwVhv727dgIOvG
	YCIu7h/OT+hsCi501EUOIxusJXUQKX63Vtn+gtKEmI9N6o1nUlqFPaSnMFLmwbDe
	QxIuWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921nw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:00:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103db79014so1715006d6.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788516045; x=1789120845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=MYoATRCgIDQWt4lLkchfJsEgNEfPG3jT2XKW87rN+5p4V+kFzZT/R8tsltUGFbZzVH
         XOwx4zspLoxRa6Qt+3R4cWWToLdi5HQ6KrmgrcmWXtG4RM3l0ooqwwjrFtW503sC87aL
         iFGHyXJyYl4YBEkYim8OQEc8fI+1H+lgHbk6S1QH3wjn8GjR2FzZqtv2SK2mGgzfwqab
         3Rk4YOioDNq6K+Dq4UqnFX6LNdB3Mp/4c4KHLpXJpizZ2HCyHsEDbY1bIsuaRNTzfVfi
         AOFYDI3sMNjVIKAQrHUgcYcJlRdBGAlhCOCp4iyG0du0mRdhBDqAvrQkSs4+l8YA0mnl
         ig5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516045; x=1789120845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=FNmH1jE3uAU4CYbb10KMDev/81MrNKn6trxFH4Rfpj+YngqN+mW7VAACpqXPGM5+RB
         UDKGo82HujIF9cmCmkX5xc1AobaonjPTfiUcedZ+LPBQJT3BrrvoR5IWmKdZfhlM+sho
         j0ED8nRKro+0AYIcC/iff9HeE3UOzIVObKLnqTTg2llF2Q+aH8MpUyzmCsh4LG8+AqHM
         YSOZcc/a/Y+EsBRnK3TTBWNNMyLSERKGVXED9+V9zW575oADq9eheEgk84Gd5dUjq4Mg
         wB5vm1P5/fdTPYHjgBRyGLR7HFWfsht5QOuHgpaYM6P0r0zdkDD1rnc2/jmLL+A+tASp
         szpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBZmSXQoubL3cb21ie0Nw410I4QyYKrIFZypvEUoi19aTFFo5ArVvCiaAbm3+P9bGQobLZEVnG12yC@vger.kernel.org
X-Gm-Message-State: AFuF++k83T+RP98tU4end8yx8Nx3oTcp2YFtpTYh9x+uHHG2b5qrFGTK
	2Uaq2SPTD/K1+kl3uxcsDM8fWGwwthAwSvzE7jXxe8jCE0EZWS1atE/yD6cVLylRwPFwk+XFcCM
	n/ruGuMWB4ZBRx6vJBRfzKl4mLAVitqWYQrZzakpYrAPpasWtPIsT4/xKk+CpiGqh
X-Gm-Gg: AYBFou3eF9EMhck3Z7wD3TreH+vgd6ky34b8Zxkm5U8vNLxQFaOpz7V/lKWCiQ21T3y
	U7C1K3ftbx+cId24jUoY2p1BhLpXq78mcdR9/PxduSW9ZoMP5fpjHchAVla3wSSQbJJGSWChVwb
	mbCEfXTwaATC6XQ+Vo55UVA5/gc6LHS7ueptuVOQT55EOrPK1aBKJkQBDgTdmBSv4N503Z7y8PK
	g3OR8yvmqFmMSnuOZgRAdmNz81pV4xtsi0FP1dbgq4ufxYexambqpqoyPPSbMK2FigHY7rXQ0Vs
	SMri4TzZPznmUFNah11YFC6pUUaYj2xp6isrvJDndHwWrH71b+KX7Fqs8XQdfZhFtzGM+ii6MIp
	arTcff7kPS6+P9vFgtfzrGw==
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309600985a.4.1788516044896;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309594885a.4.1788516044198;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm87942566b.1.2026.09.04.03.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:00:43 -0700 (PDT)
Message-ID: <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:00:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX9q6JGUG5m4we
 vmVlHxJIyscxZC43WF1W83V+arbuUXeyakQlkiAhseM74+VxJGGI3AEdmif/iryMyI/dIYMBq/j
 /4yJRcjNKdAhkXFVTSoPAg5eGgQwPqu/fl7LDQ6IV9KViYLJ8K5Q2FoGh+Mt7tQ2TETOpLwidPF
 cafobn2afMgafZZhM6oeWTaDBEMreMUSd9BtAy9GG8U8ucEr6Y3UD40tF1ZwzVLmzVm44Wwenxg
 clFh3feu3T0ZOvO6pst5J2wPvkRFFHMQTZxJ5ovqxKA5JJHE5mMfSueU8cvBxIXClzh70yXq9nz
 nS6s1NCzeqrhkpIt+LJZsxiiSc3h+DXk67vBMc+Lk13m9oycswnGIIgP0jddLWwhAJ6cS5kL58B
 PCGV44YZOxfuZPAqbw02KTUzdFx2gSVqTuo6GgL4MKnpfrOYdyldXTzoVe+5K3F77OoVCqYJGyc
 hToAqs9TjCmQRHwwm2Q==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a96cd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NRDhda5j7NX4QdZI1lEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 7Is-ObxAGRqDY1Ipt6cJZioxes_vCHus
X-Proofpoint-GUID: 7Is-ObxAGRqDY1Ipt6cJZioxes_vCHus
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX+oOKEXQhvxii
 vwxq4KTs7AzyX7W1GB4prE5iTGFgCDTNKO5u+7Yoo4NKp+b0h+yX++xHd9nutB4+YocpKB9SRJT
 dcthp70oXxuP/yoXkuR+IAx8f+JXT3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> Tested on next-20260903
> 
> Dependencies:
> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
>   regulators

It still remains on something like 40% of the defined regulators
without any nearby comment justifying that - are all of these
intentional and necessary?

Konrad
