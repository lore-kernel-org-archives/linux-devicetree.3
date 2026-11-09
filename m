Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794214208;
	b=YRzikj1vNifld1TY1/9bIjQphhXSpwcAFCTwbfMHTrIi1uovtCE9m/l3GVJoLVUx8bl9
	 XtaKSC3Q28jrqofJzxnSIPUAB2+YFKRgV+8F1MKrFFqoO6KiMa2qQhYjVfY2WqSD6s/+V
	 QXpOcnqwFpQsXEOTab0iOcShonWydm6kk1dsqe0HfBT6qbX9jCqKbS3DBxkb3hWaNBAHs
	 JkEKFcjpIdq2V3/KrJsoYVXZrFwlmR/oNY0eDJ0KHKYSAL3dKXQpdj3i9zh7b3rVRRF6H
	 Ft0f+GhYg7bVR5FWvA/dCXKmAM3F/ABGJC1K36mAUQP8+qwQsA+FzXp76pEIo9Bo3FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
	b=xyMEM6UQZL/e1WgXoEExd+ubOLy6Nc+l8XgIpEjUu+bYpBu5K9+nIakTzx73m3/dk0Q7
	 S1KUsj+eXmpqYC0CrIYQR+R78rSDZemSOpgia5C7+U9dFKm7SS4iaWJfv1Ugg5kVYr6qV
	 3f3ZQ7Zg3UW4kD/Tn7b6IT4jIDwarK1v7F9OGkWlHE+FnSjaVVtzjWDL0tVsUzeRvwmtF
	 49bwGtP5+jDdx0DJOzQiRHyW9rGTrsQHvOXAhi11FU/MfcDZ7VPnhO6pK2wzVZRZhfZoj
	 2S8OOb2VlWu5xhgVtUR/l2+GA5PWVHMIXUYd8G+kOVXZs3YiKk9ImNNNGgC2uy7yNxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG9OE5kW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doDoc+Nv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6B60A6F63
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE6B60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG9OE5kW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doDoc+Nv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AKvN3298718
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=; b=CG9OE5kW/7MuKcxj
	yZICS46QXDIo/e5a7OKRHgOYpIsLdfjmbb8i6NkMdmptVabkAOfT83fyvsHPEZ0q
	VRThHoqrMQb5zBPh66tqjgC6TPYYYjEqtrVEQHJMxC7aneOCAYqcV0raF7gfwYT+
	XWnmpematdrP3ZzqUtHIGWdGnbXu6lD/qRZD+dNC2HcO59d0HmP7oajU9ztPR94U
	lKzFOlHIbuMFWnaFUPI05UCqCM8C84173+RHpQwJ7k16hDJJ+gQ6Rab2ekzV9CDt
	00cRIdZi3yCqaF+tbzQ2b24mQ/tARKq8rwW8EJronvuik5KBmD5fOAngo/3iy3qz
	kmA+Zw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwkhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:50:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so124001685a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794214206; cv=none;
        d=google.com; s=arc-20260327;
        b=jJsFELkBgIQFBzAOb3JejJXxdNQB3YRnD/Octt9eBs5ApbxvjIXvx5Pf+TV3sjETub
         VunushMtCnLb7xsNX5LnXiQ2zhOZSUC9s8zpN0r3/MWxzLUDuvVQ2Z8SkPGIKtWySxMr
         we5udL2lIL08ceFXdyQOUKu5XBQoroW8v67I3KInH02lsqnMrL6iH2Tu8Z3ftYwsWu4b
         V8AiQpE0q5KE55G6yVCwZpt2/A9zR4OxknLX4eaNiH46ZFP6mtj3pStRNjwLG5iJGS12
         15Y1Yt5sh6F+u87+JguTGdWGjEF6w2/jxkGmWEIa5TNv1UCif6kxdFRxbN9yf0ho5ljT
         r/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        fh=KfDTK6uBYTNtd77kDlZaaFu3fO0PjqDSwZ4WiIs+YEc=;
        b=rcb3mPmKXGEeSU4lmbC9itX8q1xOW1GHFhwybisfglxFurKGWwDZcyP7tNpAZkiLIQ
         d+qCfkwc6dKOthT3sxVycqK1a4Hk6P6OOWZq2aPRiypne363bpMjK4N3eynNMFKDhbcP
         Lh9Af399ZrrL3s6msZNEuK1ynYn+AgXNQ+S6KDHotdepM/GFAQJDmKwuackH9u7ExyPP
         TMrg/c48lVMYT7TFzFxYe5ViuXIgjjvCU42BRuf7RBu6zp7n2ejLd7KsVIjniyExtiFH
         0zfmopBAcxsH4m0RovgHHAFWOiQCHaSbw0IDEsvt3FATR636WwUgvnxQhuUVXVtp395L
         Vo8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214206; x=1794819006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        b=doDoc+NvZ0gwYXx9sHVWbvpMAyXaJsW8y3m6D2XgAkrAi+A+VcNB3W4bOKQI4CLAtV
         MUTPfoJtn9IYddx7JDZO35KvUbned+E+tpeWNJrMMsE+s/fYx3u6erfKjV5qWSLZ8qy2
         8jc1PbQJpb/jIgwtYxM47MuFNldu+3ZqXKSGi1RQM/ZR/pX4k9IRmnGnImacaENp0qcB
         isGH7q5aBviaLv6DNZjlzatdz9ugxETRzoPg+glQvoGMXbW1ff0hBPt/Ti/mc4bWIXD/
         +Ef8eGb54rKps3RSofXoAq1B8lTZ+inCZ6v+j0YQBOk5qqaFHKLpbUGj4H4llikjYveW
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214206; x=1794819006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        b=roia58xFUBKo6oh0R8FR9wC5ansqYZX2umbyK0BuNcYQD5qhO0bg/H8hKrHfEVa/8j
         MBJH1hlQ1AqT5aDTWF+kdTLHEU1YwAPsnJK0EL4lsnUPm9V3m8SNlgeOStbKKrj3o6Gn
         pgd+YmQ11PSxfxXLV4l/L2gVvrlI8UBUlEF8usyaGwsIwsTjx8bq3NoV5LGYQVAutTnF
         9tXlfjG5EVGGa2pWlyroT6jowycBsRiCeNKV00ClsS55aZjZkPhiYzeZ2LkULJNJ2eSG
         4b/RR6l7/2S9S0Mfsvgmhpio975vjjK8xdvPNTdQnk1duIzyWeNPiWuN3RkZSuuCy6VH
         Eh5Q==
X-Forwarded-Encrypted: i=1; AL+hErFyXsXt3cDlwxcNBa9i/exQ3ZH1Ake96Udtq/cSsoVxaJjBCoXwU6WjQpXwRHNgirust83OI9ZosoYW@vger.kernel.org
X-Gm-Message-State: APuU4Z/+67IbAcLVHQ8YM07QoEaGZK0hJSI9vUggSRYk9oQNxu/VD0AB
	zuwZ9SQYhvA/JfgbvvBZChTUtl9v2389stTtmTe/fa1HESk76DsGKGEsGCRS4c8Td9j7m8hjzBN
	PhLDeyrG10XcRTru4s+A7wREUPjv7rWkNB6Je5OHnmLNuOWqkh2kHpK1fUBk4Pp0s8WCnBK4FfH
	9Um/3f6DpjsAZIXtsd1oaGclxBEZSOorrYbzIgYw8=
X-Gm-Gg: AYBFou14Y6AHuKwZbCe8AFjZTU/Gow0iQxQJvzc43flH3mv1L5Jdy9qmJbB9Mbfnu2h
	wOabkNJ6kxGLmWBqtLBKgXD01PcN0uCdGP1lez5nyrG4qf8rX3T1xT2m9M6slGBpmd9RwbjlYNh
	MtvarFrOP8UH4cNtkoIp75csn7FxxZuB7zzsbqHn0VvpXNJ4jVloGjLZFXpIjlai4mfKvHX4EPT
	joATMoMbOs+XX6MBGwGlzuxQO9Yt2WpCLFHK+Ro4pYcI0A1jP5lgzsQCFLgvKjpvAWY/Ld6m3A=
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:43fe with SMTP id af79cd13be357-9478490d6efmr441774085a.75.1794214205646;
        Mon, 09 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:43fe with SMTP id
 af79cd13be357-9478490d6efmr441770485a.75.1794214204964; Mon, 09 Nov 2026
 00:50:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
 <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
 <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com> <CAFEp6-2nSM6zgyrgxwP=qrE3K7aXk9cSZmhdY2F9N4Zq8SV4Kw@mail.gmail.com>
 <294563dc-1db3-43d0-8173-7941633bc659@oss.qualcomm.com>
In-Reply-To: <294563dc-1db3-43d0-8173-7941633bc659@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:49:51 +0100
X-Gm-Features: AclHuK8d7U60JHFX2WPQBgobgNeEmG2I6oVdvjvAApI2hLqbyPzNogR0RSlhgW0
Message-ID: <CAFEp6-2HpEAABdJLEs+yaGyyPmKvqcFPm0v7FbFoW+grw4iYyQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXwFZh+0PlTTkc
 lFNgswuEfvDJQpMaNHLk26b/8B4ko32/7934A/Kf/968z/DiDXBqxOlWiIF06X/kZ1i9tj98l4z
 qpi+oNoYbXtGIlA5pX2t0jJJ+wJlu6/sc/PGwnUU9BXFlidDWUlcAN4cmcYcDw0pnOSS61Zn+eU
 43KKbFBgmHmdPIWbs91CQz/OyvPG+bLRGvTJSyzpvG8zmF9GLHgZDsM9rAjx9IbYN2zYXULYqzd
 +0zAeCaGEAzcav6bfV61UsUdIgvgmjrMyPCxtoj3uEC6Rqfs4AOT418lkInsxrKpsiALRMi1ZjM
 3GkJ2xUqFOIM1A0pobLSVgFyA06+IQxfQ7T6ik7VjqNjUUhrSWIxqbH/xDiHiodNWIHxmqHhRoZ
 hctAb1BklQNEAYFkGwiqI57I5Lye3IyBiKqYA65jpYmQe3i9w5ZLnVgiFm/kJLtpgCTOk3Lhc5y
 jx2TQNtv962/9p9OXPQ==
X-Proofpoint-ORIG-GUID: BEofbSHhbKNsyF1n6Rjl5wAbtTrG11G8
X-Proofpoint-GUID: BEofbSHhbKNsyF1n6Rjl5wAbtTrG11G8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX+g9mVtLwaYKx
 IajKTxXhhuGHrNG8n+JOgXfUF6kNZK0FMXK3yqQkbGwUfbIfw6fe1cqlwZapBz7weCWaV4dlXjs
 b+JLIvdSk44ejEt55o2ODcT1kUC/71U=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1893e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ra3N8ZK0SJvzCLkdQ28A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On Mon, Nov 9, 2026 at 9:11=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
>
> On 06-11-2026 01:59 pm, Loic Poulain wrote:
> > On Fri, Nov 6, 2026 at 5:36=E2=80=AFAM Vishnu Santhosh
> > <vishnu.santhosh@oss.qualcomm.com> wrote:
> >>
> >> On 05-11-2026 07:51 pm, Loic Poulain wrote:
> >>> On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
> >>> <vishnu.santhosh@oss.qualcomm.com> wrote:
> >>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate secu=
rity
> >>>> domain with restricted access to system memory. BAM-DMUX DMA mapping=
s
> >>>> and BAM descriptor FIFOs must therefore be constrained to a designat=
ed
> >>>> memory region that can be shared with the modem. Accesses outside th=
at
> >>>> region can trigger an XPU violation.
> >>>>
> >>>> When qcom,vmid is present, require a restricted DMA pool and assign =
the
> >>>> entire pool to both the local and remote execution environments befo=
re
> >>>> requesting the DMA channels.
> >>>>
> >>>> This ensures that BAM-DMUX mappings are within the assigned region. =
When
> >>>> the BAM DMA controller references the same pool, its descriptor FIFO=
s
> >>>> are covered by the assignment as well.
> >>>>
> >>>> Track the assigned execution environments explicitly and reclaim the
> >>>> pool for the local environment after DMA channels and mappings are
> >>>> released during remove or probe error cleanup. Skip the reclaim and
> >>>> leave the pool assigned if the remote side still holds its power vot=
e,
> >>>> since it may still access the pool.
> >>>>
> >>>> Fail probing when restricted DMA pool support is unavailable, when t=
he
> >>>> VMID property is malformed, when memory-region is missing, or when t=
he
> >>>> restricted DMA pool is not attached to the device.
> >>>>
> >>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> >>>> ---
> >>>>    drivers/net/wwan/Kconfig         |   1 +
> >>>>    drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++=
++++++++++++-
> >>>>    2 files changed, 107 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> >>>> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698=
140187ca3141dfe48dbf 100644
> >>>> --- a/drivers/net/wwan/Kconfig
> >>>> +++ b/drivers/net/wwan/Kconfig
> >>>> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
> >>>>    config QCOM_BAM_DMUX
> >>>>           tristate "Qualcomm BAM-DMUX WWAN network driver"
> >>>>           depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPIL=
E_TEST
> >>>> +       select QCOM_SCM
> >>>>           help
> >>>>             The BAM Data Multiplexer provides access to the network =
data channels
> >>>>             of modems integrated into many older Qualcomm SoCs, e.g.=
 Qualcomm
> >>>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qco=
m_bam_dmux.c
> >>>> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e8=
9837f296ee13c0c31c9b 100644
> >>>> --- a/drivers/net/wwan/qcom_bam_dmux.c
> >>>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> >>>> @@ -9,14 +9,17 @@
> >>>>    #include <linux/completion.h>
> >>>>    #include <linux/dma-mapping.h>
> >>>>    #include <linux/dmaengine.h>
> >>>> +#include <linux/firmware/qcom/qcom_scm.h>
> >>>>    #include <linux/if_arp.h>
> >>>>    #include <linux/interrupt.h>
> >>>>    #include <linux/module.h>
> >>>>    #include <linux/netdevice.h>
> >>>> +#include <linux/of_reserved_mem.h>
> >>>>    #include <linux/platform_device.h>
> >>>>    #include <linux/pm_runtime.h>
> >>>>    #include <linux/soc/qcom/smem_state.h>
> >>>>    #include <linux/spinlock.h>
> >>>> +#include <linux/swiotlb.h>
> >>>>    #include <linux/wait.h>
> >>>>    #include <linux/workqueue.h>
> >>>>    #include <net/pkt_sched.h>
> >>>> @@ -75,6 +78,9 @@ struct bam_dmux {
> >>>>           struct completion pc_ack_completion;
> >>>>
> >>>>           struct dma_chan *rx, *tx;
> >>>> +       phys_addr_t dma_pool_base;
> >>>> +       size_t dma_pool_size;
> >>>> +       u64 dma_pool_perms;
> >>>>           struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
> >>>>           struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
> >>>>           spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> >>>> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resu=
me(struct device *dev)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> >>>> +{
> >>>> +       struct device *dev =3D dmux->dev;
> >>>> +       struct device_node *rmem_np;
> >>>> +       struct reserved_mem *rmem;
> >>>> +       struct qcom_scm_vmperm dst[2];
> >>>> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> >>>> +       u32 vmid;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> >>>> +               return 0;
> >>>> +
> >>>> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmi=
d);
> >>>> +       if (ret)
> >>>> +               return dev_err_probe(dev, ret, "Failed to read qcom,=
vmid\n");
> >>>> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYP=
E(u64))
> >>>> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmi=
d %u\n", vmid);
> >>>> +
> >>>> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >>>> +               return dev_err_probe(dev, -EOPNOTSUPP,
> >>>> +                                    "qcom,vmid requires DMA_RESTRIC=
TED_POOL\n");
> >>>> +
> >>>> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", =
0);
> >>>> +       if (!rmem_np)
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                            "qcom,vmid requires mem=
ory-region\n");
> >>>> +
> >>>> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> >>>> +       of_node_put(rmem_np);
> >>>> +       if (!rmem)
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                            "Failed to look up rest=
ricted DMA pool\n");
> >>>> +
> >>>> +       if (!is_swiotlb_for_alloc(dev))
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                    "Restricted DMA pool not attach=
ed\n");
> >>>> +
> >>>> +       if (!qcom_scm_is_available())
> >>>> +               return -EPROBE_DEFER;
> >>>> +
> >>>> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> >>>> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> >>>> +       dst[1].vmid =3D vmid;
> >>>> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> >>>> +
> >>>> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, ds=
t,
> >>>> +                                 ARRAY_SIZE(dst));
> >>>> +       if (ret)
> >>>> +               return dev_err_probe(dev, ret,
> >>>> +                                    "SCM assign restricted DMA pool=
 failed\n");
> >>>> +
> >>>> +       dmux->dma_pool_base =3D rmem->base;
> >>>> +       dmux->dma_pool_size =3D rmem->size;
> >>>> +       /* Track the destination VMIDs explicitly for the reclaim op=
eration. */
> >>>> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_U=
LL(vmid);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> >>>> +{
> >>>> +       struct qcom_scm_vmperm hlos =3D {
> >>>> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> >>>> +               .perm =3D QCOM_SCM_PERM_RW,
> >>>> +       };
> >>>> +       u64 src =3D dmux->dma_pool_perms;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!dmux->dma_pool_perms)
> >>>> +               return;
> >>>> +
> >>>> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_p=
ool_size, &src,
> >>>> +                                 &hlos, 1);
> >>>> +       if (ret) {
> >>>> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool =
failed: %d\n", ret);
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       dmux->dma_pool_perms =3D 0;
> >>>> +}
> >>>> +
> >>>> +static void bam_dmux_remove(struct platform_device *pdev);
> >>>> +
> >>>>    static int bam_dmux_probe(struct platform_device *pdev)
> >>>>    {
> >>>>           struct device *dev =3D &pdev->dev;
> >>>> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_devic=
e *pdev)
> >>>>                                        "Failed to get pc-ack state\n=
");
> >>>>           dmux->pc_ack_mask =3D BIT(bit);
> >>>>
> >>>> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>> +
> >>>>           init_waitqueue_head(&dmux->pc_wait);
> >>>>           init_completion(&dmux->pc_ack_completion);
> >>>>           complete_all(&dmux->pc_ack_completion);
> >>>> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_devic=
e *pdev)
> >>>>
> >>>>           ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_=
LINE_LEVEL,
> >>>>                                       &dmux->pc_state);
> >>>> -       if (ret)
> >>>> -               goto err_disable_pm;
> >>>> +       if (ret) {
> >>>> +               /* The PC IRQ may already have powered up the RX pat=
h */
> >>>> +               bam_dmux_remove(pdev);
> >>> it's still unclear in the comment and commit message why we can't go
> >>> with err_disable_pm?
> >> Agreed. I plan to update the comment in the next revision to:
> >>
> >> /*
> >>    * The PC IRQ is already enabled and may have powered up the RX
> >>    * path. Use the full remove() teardown so that RX DMA is stopped
> >>    * before the pool is reclaimed.
> >>    */
> >>
> >> and add to the commit message:
> >>
> >> If probe fails after the PC IRQ has been requested, clean up through
> >> bam_dmux_remove(), since the IRQ may already have powered up the RX
> >> path, which must be torn down before the pool is reclaimed.
> >>
> >> Does this look fine to you?
> > That looks good, yes. Also, could this be avoided by requesting the
> > IRQ with IRQF_NO_AUTOEN and only enabling it at the end of the probe
> > sequence?
>
> Yes, that is simpler. The PC IRQ then cannot run before probe enables
> it, so an irq_get_irqchip_state() failure can use err_disable_pm and
> the remove() call and its forward declaration go away.
>
> For v6:
>
> ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL,
>             bam_dmux_pc_irq,
>             IRQF_ONESHOT | IRQF_NO_AUTOEN,
>             NULL, dmux);
>
> if (ret)
>      goto err_disable_pm;
>
> [...]
>
> enable_irq(dmux->pc_irq);
>
> return 0;
>
> Does this look fine?

Yes.

Regards,
Loic

>
>
> Thanks,
> Vishnu
>
> >>>> +               return ret;
> >>>> +       }
> >>>>
> >>>>           /* Check if remote finished initialization before us */
> >>>>           if (dmux->pc_state) {
> >>>> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device=
 *pdev)
> >>>>    err_disable_pm:
> >>>>           pm_runtime_disable(dev);
> >>>>           pm_runtime_dont_use_autosuspend(dev);
> >>>> +       bam_dmux_reclaim_dma_pool(dmux);
> >>>>           return ret;
> >>>>    }
> >>>>
> >>>> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_dev=
ice *pdev)
> >>>>           disable_irq(dmux->pc_irq);
> >>>>           bam_dmux_power_off(dmux);
> >>>>           bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> >>>> +
> >>>> +       /* The remote side may still access the pool if it holds its=
 power vote */
> >>>> +       if (!dmux->pc_state)
> >>>> +               bam_dmux_reclaim_dma_pool(dmux);
> >>>> +       else if (dmux->dma_pool_perms)
> >>>> +               dev_warn(dev, "Leaving restricted DMA pool assigned =
to remote\n");
> >>>>    }
> >>>>
> >>>>    static const struct dev_pm_ops bam_dmux_pm_ops =3D {
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
