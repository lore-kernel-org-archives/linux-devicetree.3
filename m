Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514A3EEAD0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571064; cv=none; b=jUSZ7UtyqWRPPGm7bJZDauiyFbUOwM1XYNhSkNlCfPpWxJk99onoR3TPgO8jGk9UCKHJzJyeMoqG74lQ9EFnEfxeSOhiY9AQJNSjH1eZqVYGHoVyBm4zlRNCAkkhoe4AuIKwol1GoaHqQqq+tM3kWwAv9GkNaCPgeyj5yAFB6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571064; c=relaxed/simple;
	bh=pkW5trsUQO3O2M2WtDJOUPV0AyvMmpVoPKx5fTZEaPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF3X7mXqgRKDJbhe/65za/WzsYMx3Kbw0euzAUvH0671EWv1I/819YQw0HbECaAhmko2o22z8xksHqYlxgLdF3Hfon48Rkxxj5MdZWZRdc32CbkZ83u5iX1MTYP6uFSlpQl+RBg3qVoBTPUTnv98RqN8SycRnjjz616HBNq3FHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYWLqoEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwMiE5dl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYWLqoEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwMiE5dl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMVAA2372293
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KBcF3v6N3cNbIQQxRfkuaUX8
	wTPsyQxH9smMZXqQRa0=; b=OYWLqoEGssz/m7iECFiWlIXeP5MbL9O/UejApR1w
	xkuHm5qt2yguK+ma5PwMbB5gQn2Na0/jsaMALOqEHLLSsuO3z3bQKPBYqVeFF+Nd
	Bva8oKE0xEH6isPQLEj/qY4deya/3kjz+zfvsisWN6D9TY4zwXotyefg+fZesCDN
	eD9Xhp4fEzOdAoqcVcbtMLSeMor0SEzkjTW5dpY6jO8Z2ENGkwu7x+58A2qnFBrX
	VL2Z1gJ5DOKUkPT8L7HmedI4LTJIDTATi8cmynVdeb+jYKD4TO/r0Wo8rGY1ZNWi
	XbNcX2dFtgYYZ9nxzOCOKluw29VW7DAskIGP96Zz1lQpBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:31:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso37176841cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571061; x=1788175861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBcF3v6N3cNbIQQxRfkuaUX8wTPsyQxH9smMZXqQRa0=;
        b=LwMiE5dl/PLxHoS8InCzrYmx0ZJadvfrRT68jrvts89gl50FGCyaskFH4tqaIXUDRR
         HvxHUB+So2FmUqEtOAIENLZ7QDh0grZSR3+O4GMWRPIKcqiTJ3tefwxu6nggpUr2CFqZ
         qv41JUagQaAChia3RAJXpuMCC26p64zcENgP9LWsqJGf/0eSl1qFiV9PVqcdXN70pt+h
         YGsn6ReW1oJeUKwyui6vtJoEulX6F7mVUKrnYYKQOxui0AN6o0XM+oXPbFAR7XRs8cRt
         bws1FnsxtmEE4SGNbb9vSfICIrSfcgh5+Lz1X0QlmWn/2Df79pjEsag9hKY+34BvTDy5
         b5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571061; x=1788175861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBcF3v6N3cNbIQQxRfkuaUX8wTPsyQxH9smMZXqQRa0=;
        b=VWBqXhq8q2Y999/A/QFhWQ8qs3T9flwYESZqnhHMQT6tDZxI/43/HETUkotTTF4Las
         3OONq6XO/NMLpz9tDefvCGHYyaMqKDSJJWixTkb/jygBuLKrwomK0YbgR9zGGUmmYHgq
         VAcz3+8iN1U7zWSmwrb0VmUdYs4a0v+wcht42r3eba6nrNDfa2rUKKhOXV+dV/sdwl47
         y2T5Fvy/ft3lHM0zhd6Ew9WW5qSH4q4bf1XmiOZ5CFWO7u3IoYklJ7wcdYzH3AAPBB3y
         DwcBVBhOfdmEJz9//JLmayyF5xLz/XcjIQkrjLqv/kXPQsMkNGr98hYfbhLtJkIe+/VX
         4aag==
X-Forwarded-Encrypted: i=1; AHgh+RrXUSS6oo5FambRJqqwBdwAMJmB33Rltj3OAmhX8EX7t/IDRTxc5JKSBYMqMNuL1PXVNfU9GAgDbTpU@vger.kernel.org
X-Gm-Message-State: AFuF++mDYtQ1ptSbc1PMjvTkj+3QyoWHL+0vTlxu9nz1lMBG9fwvvUJ4
	yGDYS44GlmX8Y1vlwxF1rdxFhMXEkYbaaJKPzJrDkj3oM3ADx2cB8/0CT0XOzVFFL0p7mdbRJFL
	H1S7kvc0QQXncaRkvhyI+g9iYTw2jhH/ww3x3gmHuGSNtnEY4nce/jwOMKxL4kxGP
X-Gm-Gg: AR+sD11CZXZWnf44gqf4TDGFnTK950XDOwxyzsasfDM71M2YWp82yaim1NBMGnmR5WF
	LUonfhNK48+FrZ7Qto/lO9xf80E412f09hh6brZPg2FFifJeif+ac9y8ujlG6hBBCnjGB0F21Mm
	uPtYiBMRQuuvkCPMmSc0zTMIwbCn101gQLp8npfs93ri1Dqg2N6dyCqSVVw873BLGfKhLKUz6h3
	wXnQ2bYw3XI71ss+6UkU2tJUbumJiOP3fqIDxaz7NbPQSTxYvvDb2LlNB1jeRe1ZgHfZcxn8HUh
	QQWHTQANCEy7Ic98axyYod7rZeHAJDrgThHOBFUpuEM+1vqBlFTX9gCakr8gD1UIhZ8kQm9lZEL
	VI8VgkjT/YpRwMJY=
X-Received: by 2002:a05:622a:258e:b0:52d:9c11:8937 with SMTP id d75a77b69052e-52df5a07b1cmr265826691cf.26.1787571061058;
        Mon, 24 Aug 2026 04:31:01 -0700 (PDT)
X-Received: by 2002:a05:622a:258e:b0:52d:9c11:8937 with SMTP id d75a77b69052e-52df5a07b1cmr265825181cf.26.1787571060355;
        Mon, 24 Aug 2026 04:31:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1342817666b.46.2026.08.24.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:30:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:30:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/13] pmdomain/rockchip: cycle optional power-domain
 resets on power-on
Message-ID: <ry7vprhcjccrjyujmmpf4jgzjblhm744yborbnldvamj35h3wg@auo3ajz55com>
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <213e3746a36f821798d3fd3e5d832d89dcf2ddff.1787568944.git.gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <213e3746a36f821798d3fd3e5d832d89dcf2ddff.1787568944.git.gahing@gahingwoo.com>
X-Proofpoint-GUID: GKw6jyWyYE1LoqBGkQ0XcrJ4muC5hMh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX6ijFLdiyCMuY
 R7AHQRxpv0NS900HrmxpKVeS6QfLj8ou90ACH91jw+TP3lX8diXzJYYAsCJ8N4YUIW30WeJPGUr
 8cfufZmL1p2bxuEEhND6b5WdQJLm7ALCqAfND1Xxld4Pw6UJGe35BpspxGFEVMboH5Yg0vN3Zhh
 sh0lAP29TKddHMLhLr/xrAYIPdVipqVKrRN9PumiEB/3P0M5N/ieYoBYYHaOrrS1Lhv4fl4v405
 Sb6Aa+dvQnJdedT21GDWOlivjjh0/O0dMiQE4yqZncz7XE+aAJnf3nPmlS0ZRna7kvq0d0OkxN3
 TWaOiGUeWT1UlgWPnLaGKU+qUNtlPTWkkAeBYYbAoj0to/Bh+u+lswZSqva1bgcCq9n9v3tccOV
 vb02kY4xFzMcNhzQgqORxc1/O2wm5KlEFAN8RGSme4mDVVajIuohSdrtGg628veldmqtEljPDh9
 NrSYyfU23z5s8rPOkiA==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2b75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=u6E1p9BJNrHIpMXxc0cA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-ORIG-GUID: GKw6jyWyYE1LoqBGkQ0XcrJ4muC5hMh1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX25HpJIJWCWVX
 Gyul3oG4rXyheKwbBqVkpM+c8/XWgHK0fBBI7O7sMxNSREeS1oji+OpEOI+4jzrRkv/hu65PnLk
 2m+bp0bKQx6/PVZdqkuk2zeq2iovtQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

On 26-08-24 23:08:58, Jiaxing Hu wrote:
> Some Rockchip domains come out of power-on with their bus interface in
> an undefined state. On the RK3576 NPU this shows up as a hang on the
> first register access after the domain is switched on, and pulsing the
> domain's resets at this point clears it.
> 
> Take the domain node's resets if it has any, and pulse them between
> releasing idle and restoring QoS. The resets are optional, so domains
> that do not list any are unaffected.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
