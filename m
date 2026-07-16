Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56442255C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210435; cv=none; b=lluntlFOZZSAmPb4G5Y6UFcsjMA6G2U3YsQN0u303OO8O0nK3L7sVnl23W1HgZQuKEI+goDhDuu2pAcI5QzlpNwXN3ezsbfkv+xtjBwpThIJWMdh+0m7Gb+kbi3feCyoKe6X/QghnNMssye6nIYkEtMQpG4W1J4vaoXLFgTdY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210435; c=relaxed/simple;
	bh=56hH9Mr+UgEdqN2uGZiH9TzE98xa1M1lsd2ycCH8jyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIe3fn+IFlWqHLOdtDz/8mvvUvpZ7HK4XlI085qWaMrwYNrdOMeBtQ51uwRMLmjFEbz72jVbluidwRkmU9KMIng75aGf6neY91E6EaL4gcKM2MXCQ3S8DEjJqYmmPENCAC4FX8vBsi401BzS1io2eB4lkP5zk8LwZ9xRdkggHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/ii1LdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1cgNYBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/ii1LdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1cgNYBi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJknn3988184
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=; b=b/ii1LdU8In87Yl0
	OomwRG2cqCZMELNwHKFP42mW035yPfWoNXftEvucTiqhDa+v0Vec99Sf5jT4l6kE
	Nhaew5xry/W6FcnC13oLOua3UwZaM07fxpVHhm0Lzuuqk4ZOQYgM9o/gQNjcBjQv
	ZfuXcw8l6mQZNMNcJvGPZ27qHyTB/GJ55EQWFUWvHNUDskWUBuHoBysphrayNLy2
	ZKV1SD0EgqI95o9aC16bNtUg/ymAexYz1HBX/M8NMB+493iILJ2TjHiIxTGdKNbI
	bjnJISdG8p7NZj4QZ/2kzWJ64maqozQyNIXwN8AzHvIiNDX8nTKFoMb/KY2tNG4E
	W3KTNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pjj6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:00:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e4ba1cfabso43721151cf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784210433; x=1784815233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=;
        b=d1cgNYBimtNFnELYJnk5lLnVzeNVO6yQYGa0NASG6FvqsQTP0DYc/5G6x4A9cr2Eq7
         LWxUSD7hIj+MSCciwM8FOCyvnLV8m6huzz6j25KNhbbIY6QHF6nkHk+ETMkrcVHrhy7l
         ticV+JoMo2cQCHcmLnmeRaJIad95ofXWhqWut2mbIMykZnIAcBkvMWUb6QetgGDS95t0
         QVYm3UCDATHP/lrYGfehTxoExrTZBdS78+CR/8Qm2K9jfpcgg1rvAGJLtZqYKcJPdHXb
         sdyx0fQAA74gyoaizV+3lSIV0yIplPZD9quCogrASr8gf4QSxWnXLA7TBu6Cs1YAwykE
         frBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784210433; x=1784815233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=;
        b=Itp7ucMzL3/QzkUiekXH1qObeAjFZttnV3wS0MPpDoNtGClr1eFzOiLS2UlVFuQzr/
         5o0s2cfOSdIl2Egrm+5kGbkRiuBnDVDIfB/is9TaZyYzT3Sg8/wtZEWYrVq/r8HddyeQ
         a6f4ABp0n5VxIdNxVJQyk5TNSQXX2t6GIXlKRojUf1KFY1jqPGjDu5YcVEU14QBcG6ev
         /7lp8x0scQXRpqeT+PU2yXZw4Et0SmemquUvlmi0mo0ERC/JjkdfJTeBUwft7vJQyEUD
         JvllBPGSTqE5QQ5ZpRw2H3lTobMvmKzFNo1i79MDTaoYmWwyzBJUc6cbDd5aSOdQMx/G
         anAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp129KXexnD3rEMnbtHjGP2esIP6KDnsty7/2E0uIxZToyKV/YxTIqyB21n1DfK9Ww6cBNs499B5jD3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6lHLZLG5jJVr3kYKNCrmAwOEyj9pUGvWUdQU7lCCT8EPc7L7n
	2f/+RTHfcdtd4rK1sgebJbd3g8cHzbDOQVokuze836haP/5GTKoeorxiseKAQa1gvEuZbe0s8/r
	/dY3X3lclVBJBgeGMTljBjmZwRQIdMoCChHzIWkfD3+P3oy1bd5K1JtgoHxJg5h7+
X-Gm-Gg: AfdE7cn9iZ+4tutuLPJtot9edVXXVo8Eizn2LndOww2hZCOICPKNjixdVs38QfWpj1T
	F8sYSKR4haaIVXQmxMQDzyX8RgP7mScRQpwirGGqxJCXbIegEuXMBpmq+UiwuSbFcSQ4EtdLhJM
	zYADp9Q9iUvJM82Pn4Ig0MOdWZiGjRWCsFc+UIdfQl71mfd2nDg5ubiqFnyMM8RHGVduoW4wMfa
	pLSx28jaxOG/KB7mqBAq+uqCZv0UUNaG74GrfBdn+v9fSwZQPa/PfYOVSqGjBscHbP9uPc3VrqG
	SGIHu+eTlArIWNMybnfnkS/XIvxWUoHLTXPHuZdE+/cMGXmRM63IY80kQd+R1AuU1v1q3h/jjVN
	O97uSeJzVW5e/W8rkmXmJC9yxUg==
X-Received: by 2002:a05:622a:248b:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-51e4f001fb9mr78303351cf.31.1784210432527;
        Thu, 16 Jul 2026 07:00:32 -0700 (PDT)
X-Received: by 2002:a05:622a:248b:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-51e4f001fb9mr78296231cf.31.1784210427591;
        Thu, 16 Jul 2026 07:00:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634debesm24715020f8f.8.2026.07.16.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:00:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Thu, 16 Jul 2026 16:00:23 +0200
Message-ID: <178421041977.22068.381645557591400339.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ji5qxgcfXW9rWiVM06FNpgNT8r5nm9x1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0NCBTYWx0ZWRfX4DtsyP8+rLhW
 dRRfjtV8gPHYBOHUrAKBiX6TtG6L+7BTIhC34aippoCx8938xlqmmATIQmZaTB4xbx6s34hEOdX
 OayNGZa4NfjuPr2pPzS84Z56doN0Xpc=
X-Proofpoint-GUID: ji5qxgcfXW9rWiVM06FNpgNT8r5nm9x1
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58e401 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eKRsk0K3N-AHOxSAbpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0NCBTYWx0ZWRfX39g7k6C6d9of
 kRR/MJFoqF+aXQPYAUdYO8HAo6Fzd4o5FKhU/CvzOUM5CyYKnXjfACrh7v7G9mXjhNb38JMoAZ3
 sy0kZ3btCYx7Zg21apaYUvhGGiQEVvjFv0ODk4mrpbFB8IQjMgbAsYQ5ecmlyUd9379aTKMNDcd
 aa7qHr3NrgK9a7CKVgE4OVLIc+QvMII6iiNPe9vz4I/BLJYY4OxI/Zl6QtkLdqBWZSwcLB6W2mI
 6Uwd/tHtxnjpBq19fmBRrzpovNA9QY/n6BLO44a7GiLTyJdY6Oar5H/NVf/rAV4oNEo2a2R+Oa2
 kcNoLBRnI3C2iI33vhTOFMWbQH0YbkeTTD8lNBn6Hec2wrCts+REwyO6ihvcMcnw6AKutb5fU93
 HtLRW9Rn4cthNi7p5zViRLCnmfjd4f6Cb/WN7f2pQoKNlYcVAneTqNdKV9XLjbF/bWovrWFEQGv
 K8tdVmkKhIWrPDqZSHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160144


On Wed, 15 Jul 2026 18:51:48 +0530, Ravi Hothi wrote:
> Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
> functions as Milos. The key difference is the slew rate register
> layout — on Eliza the slew rate field lives in the same GPIO config
> register rather than a separate dedicated register.
> 
> This series adds support for the Eliza LPASS LPI pin controller by
> extending the existing Milos driver with a new variant data struct
> that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
> The pin descriptors and function table are shared with Milos since
> they are identical.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
      https://git.kernel.org/brgl/c/f81bcaae1edde95c684436310edad8cf849f1f1f
[2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
      https://git.kernel.org/brgl/c/82c3edf8701154e2768973ebd4c0d2f3bd29621e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
