Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079121;
	b=kjKuJPiwrls+7c+23vEgmqObgrNXXdYy5MAmnyCZwrkwpHoLI8u79Z6OBz5WaRNKFjIr
	 dFspaxuM2/at5WagkFXWEFSWkKcLC5taHgINx5T5jgy+a4gYe/7IezVte3rpVURQ6uwB3
	 WRNG29RllcPfzXtjwNCuGEDQCvT2Zv0R0HGJ1imKZutLAFL1gqOF70ysIPiYEvOvsu1Q2
	 qGjQ+0CKG/ot5l03L6QyGMKf2ayuyoV2Gd2KEEPS8+3jdAofyC9YgWLvf/0ppH4KWQGgk
	 3OVT6OL05/sbAqujmAkX06l3+hhNQa6d2528R289xmFGsDC89gtO5SFGNDwWNAXft+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
	b=Ow8UUQT7YqwdBRwQabUzWz60LEWEXOl/txqnCubTZygfunW0NoBbEu9ZcE6uE9M5IhLr
	 LzTK+ZMrmBneYFxawIB9JobmDXYfb6OGe8bR2YY0rc0J+7CzO9KPqCrf9PHqxzRi1QCwx
	 933df8ixOJLJmkbe9M80KUMafbd0snrVEh5nTrRw1Dx1sI/LQdNR4yBs0PMpYK82qfAu3
	 XxU44jTwdXK1nSCpVPSpmp4fa8pgw/4deLN8CqBSmIq1y6sIFkoIccyadc++IDbULmMZ0
	 0KOjB6SzgTdsRMI7FpDyQIFABW6w4ExSu3n+kc29ZR0ctA3HgAPdR7MS4oRQgnJJrwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181160A2615
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2181160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v4as1962345
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=; b=GaL5S0Np/e82jLi4
	2RnY2BBKkZLVSl0AtfjZXaJBeSIt4k2eoFEkdNZoPRRQCcwuHR2je+CbCCJhjxT2
	qFEtzE/ytpmE7E11HwPkc28KETBPXZW3XSFjFGtSWoVqIRx8HrAJzh3AuSwqxfCb
	oaiQNQv6UH+BzwPw52PQhrm+255XGNyw+/yuYOWQ6lQQqF2TjxskrgiYEfLLxpt+
	SaVZlJvGbhAnvv9KIoc/jaV8s9xzBCXEwpn2zDPceEltTUS9Fnm4AVbxCokA8GRu
	PaRVP4bR0d9mQ4nMKe1gi+1xCRBDTYg9Xoqwoxws7Ct2B4ymeZnSCnTPhMJQzFqm
	Gg7fQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcueu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso42718985a.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079119; cv=none;
        d=google.com; s=arc-20260327;
        b=UTr569MjmN61L52AhKnxXH+haYHKil8hPPolPlyzcjxGIMcYxTY6haMbABKkzXqOEA
         29iScxvqzMtwnROsxNW3MyJrCIkY+DiilSnDmuGV43RL6+wXB2IHHgIY+8wH1GzB7pQm
         kbYpeTB53xVnlDZJsf30YAoNdyw0GvxUFbkB9Bixhp2eYkKDZH8vQHI3pLeA3Hd1Y/9Q
         SoCFt2D9lKDPPP/+H64jgez+E9VHCnpGgdVNIVEP+lxxVPVf0SpVN6UY7wF3mz9sFgPe
         Oy9kgXj8D9EFzv4+j5eveP0j9vXuVA4LP/v+3HrleyQk1ey9/tFN2a5+4irNy2/f8MUu
         JL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        fh=dde4O6zX1XaP5ePcpcwfddXisp/VJyF0lKaOgFK1enU=;
        b=lPbr+dCm2MoLM3jnteD+4jTAViy3UosT2xr5n/YdVCFmZO2I0eOKx75r96zgkH2m8v
         DbuLgDUAUnK0jV3b16KM2JHfjYpIlZfvXT8TxluRqgO7ivD6/u2DbJWHZz9cejoLUm1A
         0T2uLl/XzXfsHWivjtth7do9CbR6aoGVbOpqRCWsSGVYu4F265l6G6KrplNqzfAx5COU
         iEdL//gLPCmuDUdstTX8js6rIhOrIJ4FnXpPSa28NZfRbD0RfnVhTVgg8qmVF6nuk6vD
         +Ra00MQ6VualFkA9j+hFwySVBXYYkA40GsutRQP52Itv7fiu6Bgk/pYUWbaYJQjXorvk
         uDGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079119; x=1795683919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=Zhrm4Co5VzIAgsW0YSam8Q4E83eIf/guf+XkHo4BJi7k1X/P/uUwk4LhpLN+hL82I/
         /LtQXFGg5HrvG+hPp0a0z5GcgLw5gII/vC07zAux2vC8NRfe0BcHacdoZTt+LjwdNFKS
         mbglau8/CZB5xd35WLf0PFAedHcygwHhgMleUL+BeLxKUlDVPg41W2PMD8QPz49RT61Q
         oBJcnLeGMGe+r4A/TTep2OWimNcmk62+5osqXvDHS/b2dnwwnii7GRZ7DoncNoiExdR4
         Kl5Ny6uWxsvYVuBaOEF8L4dfCHJzTdQNwT8gzwHxvZUxlqtigTAPkzF1SWeoIg/mm+qc
         HPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079119; x=1795683919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=DkQHRIyiV8R7uuEQqGEw2WjmyCU/tZTZAUMdByVaJk5raIz1N6Xo8U24yhEqEWImel
         sYCdGXgIuMsO5MBnBXzTqOJr+znSwE1xNop3PV0/Yw9x5u2DbeELBKP2/m+TF1gEFTIf
         /rr/QO5sQRZdJR+U71oniWKWBQD7GStQlHTKDlzOXT8LMw6h2LfDtu0+SJV746voXNX9
         +K/6t9pgQO26KokfhUQIGji43m0ILZ4rwbuxPXf6ARSUoaYa0S9UuxBB96Ca/GN8Igts
         7vLhgC5ODgobA599BndzQ7oVeW6ht5CSUS/BADlsAZ44BwziM6rKLKYCDGMd3SzMUyW5
         0s8g==
X-Forwarded-Encrypted: i=1; AL+hErErPKCZTZcl6l1ozJTq+VxzTAbQEk+R0psCT+2wOTCVBCpBsQGmw6RFPF9mfbjX4YeLQu4zNN+8yoyY@vger.kernel.org
X-Gm-Message-State: APuU4Z/63uXcXCyHIuUlB1VOSYn5spRwCMwtrKy1g9XD+wlCj/JFlUeS
	LrxWmJmzkJ0521Xiy5tpdcj5pzgsPD9XnNmWDvbtzMK2IRiCDIrQRi22FKCbyKu6BGfcs7uZ20x
	kP8+42Td5NBHaTy/q6dXs7nh9aIfagftcLcq/2mPYRtuCyBzzjDaGbS41B/e5dW79P2e2PX/hG2
	r6qoI0oe0Pi3NbePr+k/r3Y6q+vACXb9hTy2K78sk=
X-Gm-Gg: AYBFou0QNYn5RXWHR9j//vkeGNOvAcrMi7qumnGri8uPFbchWXoFzLaRSXyN9kVjMW3
	sYz4DUvNxe2wjW4835wSStSYAaK8fRf60bm/QC6OrAwVXt+9WuWephm9+yeNHUpc9bqsQbrnKEw
	NMOZWZyMVVZNwSRrJ6Gpr3hvGFc1rcrIkePFk+1t5PMtQiqeX2xkYKCUd1R+83qx1BIe6H1ajia
	Q1PFb86O6ICrELtD5NwAjG4Pck8IG6FvxmsJibs73apVRXSlIcAQpMNSMviSgfCrVPNHDfp8fiY
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id af79cd13be357-949996055a9mr954534385a.68.1795079119162;
        Thu, 19 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id
 af79cd13be357-949996055a9mr954529985a.68.1795079118704; Thu, 19 Nov 2026
 01:05:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com> <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
In-Reply-To: <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 10:05:07 +0100
X-Gm-Features: AclHuK-GXDRQYMjZzNUPKgixOWRkc2SFP2WEVl061PLLQkCPbkUsldWxw4HirwE
Message-ID: <CAFEp6-1AWQg+rpnZy4w+4khc7PC8CfT7drcL4j+upDWniow=4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: Alexandre Rapaille <arapaille@atlr-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afebbd0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Knk3v0qlAAAA:8 a=s-NlbNPW_lAo8gpM8kMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-ORIG-GUID: TccgHlfV37nEpuWBKV-Qz7pGsR9eUrf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXzOlGRTYYLrTe
 16uZCiFJFq5CNN3zn516d94Psz8VDdNNbqQlTQu7aQQnLOK+XSohCX9l4bis1o2pc1RmEN4y0Ew
 4jjjev8d41E4PmNdsfk3BijnLmIoxpR0bjL9T7C32Zu0cAfRcNTdXar3/fHQ80AqV3gWlNGcNoj
 +7QvBaPvQwkKbAMGu3oBpH9Z38Q3FzBSk1d3GJX+qr9iidyPKLR23p+W9ehD+guCgOVz28urDyA
 TxkEUDVgHb37H3Br0Uu8BjjDNSu/3oa1X+aORHUDMk9lNrFJ3mOqjXLoif3t4IJF3Me3HHapvem
 iVtM1aZ6APufgo4H0Kzf0rQl7JyCd6g1oZD3b8a19NPXUZOvDhmruft16aN7hCvUv8B4OBr3Hhk
 QSDYjWinfTqzvjejCgSFBOWiLEFlnJ+chhoAqt9WV3w+/GaiIC0MaeEeS1K2YP9ZgJSmhGu5dDy
 yAKSEpn5l84x/vyGuKw==
X-Proofpoint-GUID: TccgHlfV37nEpuWBKV-Qz7pGsR9eUrf1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXzct4XG33TEoN
 WM6mnDIdnBaU1kE187n2LO0ONizswsjqrQXrEIZplp5jQOHV1t6JGKkAfJ2ZzCZhVjVXWbWZY4F
 w5u0d+nZEg2yl3ezVAlkWN8yXahgxko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

On Thu, Nov 19, 2026 at 7:59=E2=80=AFAM Alexandre Rapaille
<arapaille@atlr-engineering.com> wrote:
>
> > Can you explain why it fails? Is the fix at the right layer here?
>
> On the first probe, request_irq() with IRQF_TRIGGER_HIGH overrides the
> DT's edge type and stores level on the mapping, which outlives the
> driver. On the re-probe after a WCNSS restart,
> irq_create_fwspec_mapping() finds that mapping with a type different
> from the DT's and refuses it ("type mismatch"), so
> platform_get_irq_byname() returns -ENXIO.
>
> The fix for that is patch 1: with the DT saying level, both agree and
> recovery works without this patch (30/30 forced crashes). This one only
> stops the driver overriding the DT, as ath10k does; as Luca noted,
> every other qcom,wcnss-wlan DT already uses level high. Happy to drop
> it if you'd rather keep the flag.

OK, then it would be good to include that information in the commit
message. I'm also wondering whether the actual stable fix should be
limited to patch 1. This patch could potentially break out-of-tree
platforms with an incorrect DTS IRQ trigger configuration that only
works today because of this override.

Regards,
Loic
