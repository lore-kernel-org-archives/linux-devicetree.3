Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D572C472083
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932974; cv=none; b=hlf/lgkroC61Y4sh5F64lwokhRxSrUDX7ePLs2LUmH9vSABcZXrrKvLGm0CDWWVX9W8OU+UM4Vi9ZwKIdirvCd6tyU3IJXNVzFUPU2bCq6mEpuw8bBF8WV4FdO9Ga37zeY/DVYONeTwTdMuekc8P/eb/CQisUusHdY/Y4mdAWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932974; c=relaxed/simple;
	bh=4SJLPX+kwQBXDmR7raZp5aqQUkMqAt7w1SUMljxgVVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttZXiUEY2zC3C3FRSQ4LG5p/gDEyYBNwUJuiaVdXsqH2M3SFuNLZMIwHbyoA0UR6NJwfDvRTDJtoLe7jNRqsndfSeQHGDEiMGf8T4g7fDfCnk6v5RX5XuzeZPYSlihm6h1j+iTEzPmXPklicPtldcgfdd7SBYM1WO1NfpPBJ+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZchkmoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XscINgpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZchkmoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XscINgpC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j7Uf233761
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=; b=WZchkmoIHU+qjvdF
	/Z4KPTEmCXryerWgvQ5fMse1US/iYI3wSkEpZRyO9WGoPqieh/8rC8ZVWMQR53lr
	vVUFk2iL9fQeVLXDEmpuSo2Js7cVYiLeHQqNpb43C20c5ZUmXn2YarQfNNEkG68t
	+7SQlclilqHXNy9DFUlBTX1FjK5EJXg4SQcaCzFuK26QOVxPZ0AbXZP7oWjPQD0T
	01n7maRnfDajUkzt6JUfyhrzIJ+C0DdXjqnhRFMAOXFoHjGtujKRYPlcgJxlaRpz
	HFuP6osAGmZzvF542wWwco6DJXMEycU3I/dZwr3M6huYJgtvbMSyVIwZTtx1OfDV
	dEaXfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abeer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:22:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso7249677a91.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932968; x=1791537768; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=XscINgpCRW7UUjRhn//yNfqH0y+yzM2kmk88wBDW34FyMjaw+ugw3c945x0UWhxNNZ
         OBQSkK5c9tTvsysYSZ58cjFpfi180GnNWsKqt6PJ/8pWiSOw1l+nCcK8LqGe5x8CRWrj
         /v9RBZlRfuIqXGcvNB/f7y1YRUIPdYXyrb0s/ccl/wLW9dF3BHEXWn8Np5s3ToLVlXji
         HZmolU6PI4CqkYZ/sAP2bkxI3KrwAek8+s2rtLgTyVgyOu/qaII4sgIpM9giGgfF8XgO
         L6gdOaPUql/wg4QY3UvZmIsTJm4DdJH88FDCHN+vP3oHMHfJjJbI4uROiFHzF49ROrva
         ha2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932968; x=1791537768;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=E4EVdEsyMz1MLJZw/oFTg5R/NWIADMlUxPZwo3CoucCPsMcyQdFADUfmkVqaTnOvIm
         4pqU4UVCAsTEHJMZ5CP1ZwK0/Uokp6BGxz8zarsmrDwW3/DFsj695r+eN3npFk9Py7is
         Rq90VS/mpBOVKwR/iyNxUpDAJYt84b1xTE5n32RQs/Wq+l2Eojog457Sw0X9YwpEGXH4
         DqqiO5W39XUm8Y0yTJUcmxtekz/MQWV2WPZ7GuSbt2QlzepyJwQnJBaBsQM4Hnw60lVI
         VjKD+sk/egWzhgc+xFK6/yzRER78EcU9PHcg/OVDalh4nNA0vCDJIxEIXvkVz6Z5xo4q
         m3Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwNT3fKlnDMqUPKuiBjAHY9qOXNeCr8RS7ifLEG+BbjgW16wNNXwSU22gE4Gh+SsS+w2asu8vUSoc43@vger.kernel.org
X-Gm-Message-State: AFq9FYK6b36Oe3hzVHajDEraOzZKUIcwcvirFWPRVVhI164uKr8fOF3G
	J+NVNySOrje1bVNASgWhwjUdjMG7dVD5WsiCy86USTuhR/bfe97R4HaK8VZHz27S/QJo9XTPiBH
	JyP9LmOcNM2ctX5iuPUeHjMMdNL6iHyGqEgy4rKJMwEQTQoVixBK08yCqBUe4W3so
X-Gm-Gg: AYBFou1onK6dnjLqcSrrUilDTjMxCR2fsqGIUpt1NpYxnPxyLx9UpedXGRbv+YYY699
	hlzzMOiSstz6f49iVtG60pMIg2aiUGVvZ8tqQ5GhdvKg6WPMhgftEhN8fet4iFl0gX4r2eLIz2t
	Ul1ymxnNA4PG+/5rq5eZMdofbBpOLC6w0llqLXFyDzIyBMb1VACSoZnc45q0Y4I8NpuQLdYliOX
	0Un9EssXzDF7cJADy03sk2hkfTQuRK1EOplGViR6TFSBXcL+7Fo1Gp+KjqwgH9vC51uzCozx1Vm
	2WvjqfRYlxEcOHqfjEqC5mFcEnvuyuON8LWRxnEJKXzyC7xmDJM4u+19zxFqeuk3O+M/kDm/yMt
	B4LO18owUo52R
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834296a91.61.1790932966364;
        Fri, 02 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834240a91.61.1790932965653;
        Fri, 02 Oct 2026 02:22:45 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm616096a91.3.2026.10.02.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:22:44 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:22:41 -0400
Message-ID: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXxMqAy2Nfh8Jp
 BvAvSYAkdmpw/ZKzwD0Yy8P79MPUKSmaGis71H5koFwAmVpc0Qpi9TGJ7+YUwmYbVZWua+CCqn1
 h51/+LgxqAabscQtG9ZYIsx0g571WV8=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf77eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iwpyHwDBbu1AC0YlxIwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: YkRHunlnr6DkThwxmAR1z_JgFEO9oQoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX3KzH7ztpYNyJ
 OeTDq6Pw2WgtP38Zoqd+MOZYeDU124JmA7pV8HqiD3gwzBtJBDsNRlq0XcqBUpobqjoK6RQ//XC
 4r/xMiEsvcJFdoqyXjzuUY+itII9D6N1bFDM4eOfbDgv2fH3Ra1kqulppYPVT4LuwD46RGsoN6K
 RaRXBDTH16bhBkml3gf8Oy/iDJ1OG6fsrMuIvpjv0rBN1KmFKfrn696Y4K8pTpkyVgKDKR1sol9
 btyKTpfQUXXXKQO7ERdHxPtEHeKYY2x35bXR3D3f7HWWS0lR93T8hnvAtKYAE+dSTPV/L5TCLlJ
 6joYoCv0WDYinGiIR1Py3to4H4NvqYQDo6JYccyAsY96z+ef5hYK1HuUs1Ms18Foe4wLKgwgZLl
 UE68ZG0HFlTlhaAsNCnbTuax3jQaafjrOO4t6W555hjjHzzAipdQaphMOQVPh2q10nlTN3C+Slw
 a+JGggivklgXB6wbL1g==
X-Proofpoint-GUID: YkRHunlnr6DkThwxmAR1z_JgFEO9oQoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

Hi Radim,

On Tue, 29 Sep 2026 15:12:36 +0000, Radim Krcmar wrote:
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?

For DT, yes. The binding requires b whenever zba, zbb and zbs are
listed, since commit 0cdb7fc1879b ("dt-bindings: riscv: Add B ISA
extension description").

For ACPI there is no such check. But B is a ratified RVI extension
and RVA23U64 lists it as mandatory [1], so any serious hardware vendor
should respect it. Right?

If the firmware does not advertise B, why should the kernel correct that
for them? This came up in v2 [2], and maybe here I should quote what Conor
said in [3], which I agree with:

" Part of me wants to know why we should be going to a bunch of effort
  to cover up for inaccurate devicetrees etc. Garbage in -> garbage out
  and let them keep the pieces."

[1] https://github.com/riscv/riscv-profiles/releases/tag/rva23-rvb23-ratified
[2] https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com/
[3] https://lore.kernel.org/all/20260604-decency-salaried-4cb69e1c9fa9@spud/

Guodong
