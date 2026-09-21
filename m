Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397E43498F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978324; cv=none; b=U3TS/gpWG4xmSS2i65bwnUFIwvPuCnVe51AdfgB2Fmt3FaxX3ct9ny5lL7F1DO2nuMfg7S4rvsltC5Zevs5jJb90L2ys4b0BOz7X6owN5SjyGE/AlVogzyB8/zMlpu3dN8n6AupwnXHg/pF1cC4MNttMoGVMjTAM9wKtpYwAIrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978324; c=relaxed/simple;
	bh=hv6VVt9whNtlHG/YPurYOIIccQeVJr9XxbDW/ZaPg1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsneIJq74QfHnnPYh7QYyxdT+0Eel9czQ7GsARBMSJDXJMJGYP5vooLWtHo6H7JP67Xsh5AbHoPuMpo9qcgYQ6q5I/RruxnUnZ3YV4krri4xqUPKx/qswFTZF4bhXdZltT+KIHAGf8J+dUonLeyUCjZVAGnkTPHrU8CrfHdX9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owNShZqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMYpC0bx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owNShZqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMYpC0bx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3VD957080
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=16f1pSPll4Ie7DhW8oY4ccee
	3J5/JdFyisY9FHHi6Aw=; b=owNShZqmzAmcVUGC9uRxPen5rY6jSWOnuWyXKzsE
	9K8PGrZCO2tazZMqJtUSS08LkCUnai+WW2PwGqfz3wj7l1b8QPzD9WUccQKntN34
	pXya7HU+ZDuuIbTl+Lt37JS08YN4a0riIYUvr6kTr1tAIQPFeG7JDYN8MwrO0RW8
	FrSIfNkokOgbQlMmUvlbJ7PxsObDusQTmjaoPslbzxNDfOLTJ3x8LiHtgx4BMbHA
	GQvrCMrSBHhWV9lUZvmK2d/pgvL37h3S8vPAvDA6F4T3dbJ6yRNc/smM4C67igHX
	Zu9NZDOAJl4gIxMjApWylB3TYNT8N3UdnZ9xpnjlEWSbPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d070j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so675804785a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978321; x=1790583121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=LMYpC0bxvf88n5EeBMfmvD9Vhg5TPxbqPskQfRYesl9YMGwb8g2NcEJWsjzeb8TNWt
         UN1AztYYcHlTgNzTDNYdfhhPdr0nqjsPdGonT7+yrv0LpU5sPIfaomGTBTRavTd4CaWJ
         Nt3MJ3BF4zXO2bePjViCtaASe+zJPOwMQ2559n2uOeN13wQ0ryUrtAeKKRMhFVyIq0Ag
         sf+6AuL9QHx77tJubm/JT+cGpcf+3SvDWNWtoepmn2F85EjTgnQbmjSok4i2VtrWIBb2
         28ElHcEdHGOFJf/1q2MBEF7ai5C3SfjFKvUjxe6LuLHcx1QoxXJzwfTmvBMFImvIFp/R
         Ocng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978321; x=1790583121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=YD9VVyvyS8vEbpNZrKVFBDMnCYjhLJlpWfHX0wAwq1xgWmb8NH5kHLNJn55zm5QO+Z
         kmmp97jU+lZwYeqGjzmH82133+CP31i07SVmNbewCNA3LA7aF2v+aXbZ+X7OZx26OIJI
         HChOOjETKAN1maN5p+8q0YE9ueHhtP9Z0Vv830kUw9B9/avAWB5zyqI64t1I7SR7NYFK
         ICxNyu++7qS6PmLQj183aIGDHE0/PHHg8Xiwm17VoEqGcl5PRnwlBJEIfLd3cZHr9zoZ
         oW2HspI/ULdkMVdpS0bqzZ010dwTDS2+Rk/HBNl4EcwO2LH6pa7QVG9lgClTBJVef4xZ
         PasA==
X-Forwarded-Encrypted: i=1; AKwUvBzkkfbCOmqLBzA0RNtZs2brZo8yFbn0ebZxfreeX5E3xnSo7aummPw92+VDISwDKqTR+3a3IfDzuLUr@vger.kernel.org
X-Gm-Message-State: AFuF++mIEf1mLAW/l/+9XnLj+MW1LSGkmTiIojblTC+2Drw/hl3C3EAJ
	7sVWqw2jadWvDoUZBX77tZsSOXgGVqKBmYjxwL68zN7fk6WX/L0Pb375o4MIBFUvTALZV71Q+AK
	+s6oq6XiCPCU5HBIQLy57z+pKmAFVuO0qN66F7W5r8GWUBnGwU1Leyla3sdaQQ56B
X-Gm-Gg: AYBFou1+J6RB9FEJsTEEjXp+LdWi3pQQ+FhJIthS29Z9SN/QPSfIN0FyZbXMgc9pfbo
	g9t7I4xg/EgQ3fggUm3+VJeQcs70adbksSM82ykUh0jbhdWXdu+tep9TU4wtIZpQ9oZjB8Cpggp
	zjWtWFbj4EU8sC/NdPaM23MIxvJ0civCOjmuEJBP+DCquGEjz2t+Wr+6oeyZDOwhFl82KCYI0MI
	39u9MOsWTlpT2CrXN11p8KT6nJi3T40zwshXXtmHP6Q1XoKmZv6PjOe6J6a+y+VAxYiQFWuU9fI
	hWcXhTvBzeaaz77hG87mCU8v5TkzOkCXxg7Rk6q8sD2831xXOnoK0IBdNQTLKOPDP8Jv1KWlNt4
	CaxVHXEPgh/qIMY0=
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866679385a.27.1789978321280;
        Mon, 21 Sep 2026 01:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866677485a.27.1789978320794;
        Mon, 21 Sep 2026 01:12:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm581367415e9.4.2026.09.21.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:11:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:11:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
Message-ID: <wr5s2uw2i6tdzmm5v26uzq3gdyttynqzmkferakol5m3oj2uw4@zpedm544t7sm>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vazC9v7BBp4SVRkxZ39myIXxaM92oFvb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX5Xr/kvO46dk1
 DuMdNaWCM8EWa5m85T1JBf1IMP2zm8cgNBP+0jhiec/54cNCoLzejjkTkj4GaUHv2XiwBqExIPY
 w3lRnLVxsGBnb1qtYO6k+dPDoM9VMo0=
X-Proofpoint-GUID: vazC9v7BBp4SVRkxZ39myIXxaM92oFvb
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0e6d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XreJF-S6XE7m8f1k5BYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX78LmJd2g6leh
 DAakvi3AkY07+f5cvECjgVd97h1e8CljtbbqNcr7rtbECGV8eeDWokXT7w+fZndYAg46qEnSwc1
 625CUpmqi77ydPGGG5TJo4qLZOqBUuL7mS17nkKjwl5ZqS4CLwXTRICEpDm/TeFb7ex7Ljqdxu3
 WVt7l2syqZjmxKPNrf6N4uFe2bELosBpCLaBGoWchto3Pp5K9KOQ9xSXi2bi34RQcE3v03vs/E6
 3UqvzEmz9BQy7wzql/Ec17XtEGRu+CaeV9bPexM+HRJ5WeUEiV+H/p6V5yhP8fpKqTi58dnx/0L
 OCcYia9Xft/DaW2jc2KAO7JOPB3N8vw01JpWTvfu19Vu4nNyC6gUQfpFn9D69R81es4urb7T5ok
 gU0lcCI1QTuijNg5x26RVC7YSWQ+wGQCnpikWk2X2HX0DB5LaGJmYwYDXCQCefBWwv8ukkuljR9
 VltVvsgtnE1QoMKfZRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210116

On 26-09-18 18:04:17, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
