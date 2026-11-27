Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811634;
	b=rc5qZH5k/qHl63C7eYd9Y2m6BdjJDP6ACo76/GKQWwBrQi6Ou3MqUk0h2XkVF1AkrL5J
	 SZK8CaGC/Rrkb0fxdx39ItmcLk8GgIatsBHDll+jWBshzmaorekc88/lfyqxS3ifMLS16
	 EKBgTPDKLmIux/2B455t1F1K4cEOgCZk1GXdwDulHFl6hsnjJrhNcUikE0dQ8GhEBVHda
	 CMfawDXjbNbioCsjJakXVmhE4Oryh8GYkAeP1aYhl6isERlI0rTMLATl8styuo5bAQi3O
	 dr/CPDImipr3lTgVAZ8DtLbJ9HIrH1SieHybIO27lJxa1HLaxUm5A/nM9d2ngSzrszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
	b=GLIOxFu6/wD9XK7sIGlely9X1BL6iTGWL/SWCy3WXnTavHQaC8nw16yzoF2lCpS28nvC
	 NBuBk+JNURMGkVGXUnscarqtMwjJCK2JnYhOXYTdbZSn2r4tkWweZNL6OpUHvkC2jaIfe
	 cLSzANPwZLsoxbV6vw8GjDNe1y+juPXN+83s+WLra73eEM9G5BjAdaW2J6/XbJil8xg8x
	 /neu4FLgNh1FbNYy/jmlqQd6BqBeH/AOcOsiQANgEUcKcLWERqBulQrLkYrHt1Efoug5m
	 4IkVpeI0W0FBzMzUw08wlV149k4QR6twi6CRddzmJOQoOVH3iqnbBZQwOUxYCH6oO2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3D606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A3D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAtj83038719
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=; b=fuuoNibxWVUUBiwo
	KKdAgXaDFx346+48fl6jf/yYRBSHxXzmSVdTRM77QYnK5yUtT6L5sZGhkVRnfaaU
	MsTtprL/SAeJqZdZV+toq/Zr6TL3I/ksjY07p1bcSYp+nGUWP6iS9bhIlwtPUwv5
	aCrVBoMVdpct8IYBopQLnsAKbFwKs7aaRWAzXEcYbngeeGZUxsVZKvVDWXcGDxCF
	Z67c9tu+wNI1T/sWNpwhb5vpWfQlA9QgF7EVEf1o+vRt2a4iNA6opwIm537GmU8F
	l1qbLoA0phvLd+n1WQZEdgfWzu3h1UDCTlBSj8SxvCngFC+vDrXDWBpsjLHzC077
	u5SHoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e4ngfa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so1328676385a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811632; x=1796416432; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=HkteGFQg+XXIibWQKhGtlbgzrRb2tK3qhU0z2RENhEXYN0k216VIUOZPiR8COHPMJ2
         SPdGfgBnQL86xou0JLmmstM5uHJbFIUkdGiJR+0erO6mZs3sdIj1xwP5AD01nZxlgrZX
         G4M5ciCrsvJ4hKjHQdGvUzWa6+MXAILN2pQUqx6k069gNSs85jBCdot93nU6q1cDhEoI
         TInHhRi09c6rerQAyNFcy0Te9RIcSYtMvx5hjmXyyTnfGw8NHyZd2Zx7U47g+aOUEYtZ
         QqyL+LRaUJmIQm6Am6eXLzUtmQzJnzBGBAltFVIJWFJt2C+tpNcrEA/LhpREJrZUBffm
         VFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811632; x=1796416432;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=RPvAt4m+WUY6U+8qGVm9JXwLRN65e2RYX52Q5S5WqzRZPOwvX8j3olyBrsaiSm+a3j
         b79TW3DYOH2GXBBk3+BxCgQsUFtIWv6oaRWUO9srtO5G008v9KrsY3N9eK2tB70dVWWJ
         rPqxr7Hduj9cKwQdwZy5cNZCn7jb+o60CTXEJaMA483jpatyTpcReenVUy7I3jV7nFql
         Jl30a9CxdVRObD1suAyiD0vEbZ3o5t02EH3eKc11C7WY0QYeKik4NElF/Xr5VqiQ9BkB
         gCYAjQ7LNiV4YLftxCXZ35SeqNANw33/I5S7EOZUugNy5F7MDM6LprqHMMLfSgmy0OxO
         sgDQ==
X-Forwarded-Encrypted: i=1; AL+hErEujc4keM1fmXrzQD5bMYgaohI989SFQoLP4IoyZ4QcJu+Y8Kk6vKww4uWF0Kqml4H8JXkfOxgD8L6I@vger.kernel.org
X-Gm-Message-State: APuU4Z/CvAM7o5LH30FJ7XzpW7yxTMsx8vYwmKfD2BRocNamy0u2S2yp
	JSQONtrHQ5bpFIB8hmBdzZ/MltnYovMWGA+rW5gnsVplfTpNaae1i6PVPbLJxQzFdf+RYxTaMXY
	iQu568V9H4KDBfU0G6GvhxQMrhIrpotffC7AvqCw18IgOxTXr+jIKoksw0hq7Q78F
X-Gm-Gg: AZFdTZcN95Vo1kSUBvzeTnqhwzCVYmnFVReufaTZJv8ErZ/mYoc0p/BjBoSPJUjc74A
	vqsILEcugG7F7WFT3+SqMvcbn/dF3gWsDP8RIXYRE3LbT4uwKmum8OP3cF9oxbdRnOfAYGa2N1S
	1Sz0cT5WhR+7t+FZwiwAsJyEFP50CqFpj5LRmneCxva3bKkIivHI5rFPpZuxtonQHgnapqjz87R
	8fNT9zx84X/Gj0ZNtmK2v//xRNEtHTjTc6j3XG195Ie7y+E0v0m945C0FO0ClnigA/ozjBkgsDK
	DFoirTOThvhyDIAIwBm9NEZaZyMtK9Vy+NlH9Jv7VUEbzIukCaIZrwm4nwf587DRODIBMvIdbdj
	5n84FZ4i0aoRjm03ph5YT4p1msTKTLxTrsdu+0mWNRwoNtOvW5tOVWLuWXjmVDQ==
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399631485a.76.1795811632320;
        Fri, 27 Nov 2026 12:33:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399625985a.76.1795811631855;
        Fri, 27 Nov 2026 12:33:51 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm48338546f8f.32.2026.11.27.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND 0/2] PCI: of: Skip config reads for disabled
 bridges
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        Daniele Briguglio <hello@superkali.me>, dragon@radxa.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
References: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
Date: Fri, 27 Nov 2026 20:33:47 +0000
Message-Id: <179581162724.3905807.13798536034754126199.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=423;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=TZkDGwJBtyA0TiNJhNB/OSVSV/aagdKBXEGWAdK0OLk=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCektwUucylrVH5BWh5c4Ud4McwsPdJqTGiBl9
 dnw2xSBuVWJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpLQAKCRBjTcTwaHBG
 +DMWD/wNRZ+rlpDvMQQwnU9WtQcj8Q8Bg5b8dB2Yw8r2gPvmqD28DZeiYtjDTPWIdufB+iqgz5k
 08Oy0/zegQmPIY4RI4Chc3nJVaJXm5+Q24F1IfX1gW/g92ofustFieS4e8CsLo8YKOZMPlUBI0I
 lfXJlQqibG/hp63ZeYoNtwEJSjJOwU01etsgdsOJUeZiqcw1Q942oaLpYAK14p+Tl2CGZ5n9sNf
 kx8pY0Gk9d9JorphQkOYSN7zU09LaCTXnb506TBnvr1WQd+KjFc8a0DbVeEn7AthfMNExY/E8su
 E4apPcjKnPDstI6cL4Qa3acHbxmGaXXR5phfOaWJRaHzZQIoj7SariTGgq1VS6MSa4EGII15tZT
 HmYyMS9Ias5gBk4D3ngSRwk+y/9CIksmiyB1KhHbCo4YVwkL82U2vPd6gdqi3dsA7dtx+8gQr3X
 l/IOARrDpbLzhjrWkZrcmxHTiUcKmrq4CjZNRlSS3IXk/NznBYaR4GnSpJHDqrEkJZZp3jte6O1
 AV6n2qC+eoaN1ODqBIDCLh9wSBS1FdU+4dC6rK7WLP5rXwl8rqNohrGtM/izCvEtXEeu2fiOQfa
 BZysQQPlK6osqHi8VKGKaPdL5qkD+go0wo44qHrINp3/xdPCnDc7uwzFMu2jpePgCZtKOSGiV73
 HIIHqY3tgukda8Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX2otaaIYQcKMg
 WUq037g31T4aDmrtvK2viKdwEAkyG8cItSxYVC7Q++YnQLxpFMTTRy74KDioVWzus8YVGm69tri
 2VUwj+AYif3/MijiQT61N02r3JIqgls=
X-Proofpoint-GUID: DqDEMWVJHvtCvsDtRHLJW2O1RGasAYaP
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6b09e931 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=Rh4h1jE-l6Tb1weBNBoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: DqDEMWVJHvtCvsDtRHLJW2O1RGasAYaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX98Il3dJDkZox
 oKVCskb4/HCU/wolczi/V6kc9QgmrzIKPvCW2ONLfHO//HSQ3A3n/KfInhRVkVZ6dDJFiN42P81
 b8SCgM1tOPcLWDLvTHVOiSr7D0DgKqcnu98L9hl25/rUCITCbLezTLMUsrVt5HO3rUFbgiLz4Hu
 2+1Lf7ggnpXwk92+2JQ75pTf0wQL/fBiT9IZKvdlLnEQ+zj1unAFCR8tG5zpxezNGoD/KWD+bwP
 pylwpztRLE+xIQSJ4klaWz5/9DkTl34YtXtLnfXXVmnZFUh6PcEU/WQQomgzUoYw8K6b2vyD0SY
 UGJwP9Ol58EMS7p8eHjiy8cNx59yIBSrGNHT1QxqsWS3fRVZrltualrlUlyk9YxSzLrh218LVL+
 gLzaUq7Eay4EkZdM3ogUVHsKn9B9d8kLoX/EiNan7Nsppx4PPn1np9kovIRu2PgNPqdrbX5l7H6
 Zs5H31k2c228BvV7hsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270081

On Fri, 27 Nov 2026 19:49:31 +0800, Xilin Wu <sophon@radxa.com> wrote:
> PCI: of: Skip config reads for disabled bridges
> 
> Hi,
> 
> This series extracts the PCI change from the Radxa Dragon Q8B board
> support series for review and application through the PCI tree, as
> requested by Manivannan Sadhasivam.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

