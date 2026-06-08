Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0333C98AE
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928388; cv=none; b=RmZ8x+ImSpdY1Ovcp0OvbhlZuRNF8Vm3dl5R9vARfecCAue7aS4Ghc5ISnBtlCRc6dcGy1WEpRyAHW0tcIshS5xhjtYOFZqs8C7i4KW26nl+UChvwH7p1vUUD+zHpGze4Xn3YhnT3r2notbil4Ir+gfNNa9+wv1SMw1PhA70zRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928388; c=relaxed/simple;
	bh=RCYy0IHiJIJ71s+W/69dtSzgpRWYhBpmknflCMoSQ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQ9YjBYrAkmFATaOissH9E5Jq8+GpirGLZfd/zwWYJUik4GakhRpefJLUrSuib7eQzazFq3yS4Zf1fs7zs55ObPA6JEzqoKm1EfVChrj1OifbR5hycUP4piH4uP9m6ZAZjtpAgbTGGYhpdc0FSWveabBMegt0MZHHibrLYJKl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3N1gQtS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnEc0q/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3N1gQtS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnEc0q/E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DROIT3346978
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=; b=k3N1gQtSk6OnTdvm
	E3Xfi5uS1MXoIMj1wX3SgYwWlu2h1JuCd+0V7Om7+xRUpC1p5VZWoc70uaaLLQ1S
	dOSrfCWM/Ut+fDoDbd3fn6KLk7Covdz4ClO11shd6Dsq4rkzC31YIIs3qfo/zBWT
	scbGj8S+apvyyujS5UuhcIsvHZgDKE5iMS74v4LwZfujaAxw36lOhG+iOWd28buv
	utg13w5p2vIF4YRQ211eQuAo6639MX+DkrqiASUKtzQnXgUGdga2fJQi4q/exhCF
	MoRn0NNBTon5GdL16F+/99WYZLbxs8eE7GEoKiy3CW07kBIwr4G4K3CqKcjZpj7Q
	FIKssw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8w0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:19:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso6830536e0c.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780928386; x=1781533186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=;
        b=gnEc0q/EJ+1Vp/L2aJ2iXTHxsf0d97IYT5cqjLy2WUZScMkwpBSXj2YqBrBjSmYPPq
         4SB2PBp0u1RIryn7GRROYMNB+FKpra+WJtpXu/iZQfs+fZhX3mYegR6qj2gk8551aI9c
         a8AgYIryQZlmvxq98poTZktBmWhT/JJDWUCHlUpH85iwTxIwcTXmHAxVOp6FLZjQebad
         MCVfktJW9W1thWqT04cGo7X1eQuNSD2Fx4HSRSE6ja6+W2YGn5ZXHADQaL5ZU4yVL7yT
         xk0ignjxlGjWkxjpr7DWGBASksk3MQ5b2jgF8DLN05PPkndqhNYGIDyszmBMB2WK1YbS
         5iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928386; x=1781533186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=;
        b=S2xWpjfK0jVhKKESIJVsLgwLpKwMJ4LM8s9tF/ydlE9UgC7FpCgJlZhKPvG7ukre4a
         NMEAQ47HPqSBqR6tnvvYYk7bVXjnz5LwuUrBr2FC86BdOjbx1XEu5zjkLe+fN4ldlFPd
         /EvjrgVG9krX5jbeP4vvVtkJ44ghbVG/JgBrMFVJsjwVlfySeTkPBhwR7WwQSzaYDuAk
         m/YmgWCKVYAH62n+O5UytOoOvzeOMWiXl9HJIOi2wMSmJxvjDFg1dgyCeGCZjnV7nxB1
         unohzUVQkzzAJTWUv7Vxhnsl+9mmauSssU56hQGA4WmG5ou9OM5d73WD5s4oveSkroXY
         Q8Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8TJ9g5vpGgydro/wcrAq2L4Vpb4CbgzDcc3UwADOqlOTTZUOKM2TFXvD+Jf7eMmxTLJ4OMO5nC/FlA@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRI+P4hKULLHw3ShEXwsXHd/VWFGDWpQeketnfMSb2hFJm6ev
	vlz3roCqraEgZ3hOJsNrc5PjSTMZAb8cy61Em8ZJh9oQX3CNAv4aILKQ8tfuHiZvUWPzBdqoYOq
	iu3rnPGkH4xQ56Ih8hqPcg3lXAXJAELXdfS29SS4Y2vp3whlHLOCZpZ+VINPPITgv
X-Gm-Gg: Acq92OG4n92UoBgFPkWDJYcGtVLm+vHqID9r+yeTyJBJkCQ0oLzj5xw8Axhd0wYCMMS
	Xgd8eTQ5viBbX/1Ib+c2ZoV2A7+iLpo7RLrDOvHmSNz/xr7at5wnSN6lUUssdz+USp9P85SoUBH
	YW9L9cnPWyov+6Cy2xHcHGwCRLQebkoq9Sy39x33f4LG1dOl76xu6lrRBXqfZ7Oqh0YLUws9BNB
	au87L6T76/bugp2+CEjW+fx4FRDlBpWGRailIDgO9l6jX7sOLMXtXancy1JenRzhcePxwbjJ4v3
	AyLRwrXLCRA6Zd/HSzcQYuu6xKwANVgKErmnlAN1OV2IoZEZ9klExKgSSdSOg4qkufvNRmUw+Qb
	KvqE5M12F0d40zAS2uSt7C+NW2FnyU76yKv45qkmKZhb3fe5jKWmcwVQRczw=
X-Received: by 2002:a05:6122:1796:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5ac4ca5ce4amr7610867e0c.1.1780928386002;
        Mon, 08 Jun 2026 07:19:46 -0700 (PDT)
X-Received: by 2002:a05:6122:1796:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5ac4ca5ce4amr7610799e0c.1.1780928385554;
        Mon, 08 Jun 2026 07:19:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm397599425e9.5.2026.06.08.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:19:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: (subset) [PATCH 0/2] Enable WCN6855 Bluetooth on lemans-evk via PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 16:19:42 +0200
Message-ID: <178092837981.163118.4463258851423326572.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lAIf8OPQ_Fko3x6kj0Cdb48SCgyBPo-I
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26cf83 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KxFyB6w1bcBEixo3GQYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: lAIf8OPQ_Fko3x6kj0Cdb48SCgyBPo-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzNiBTYWx0ZWRfX8WthmRdrGnRv
 Ju7t/ryLNdYNtOXMrtnprILXyE+3ec1Jr5K9VxySpGwCeFYIvQnT+DsSOef/IkOtv77Hs3OO16R
 teLV8DpOnE2QBYAvVM4wXzLbN4ccJLwYQ3Vs/lPQJurref8eqUkz2gr+MCp4pM4JR8mKJCdtBlW
 7lVuzUYaS+HYDAglGvXNB1RxCQAh7H5yOFwoiA/9AoBiC8PLHoZo+rG4nqbuT4wT+D9AVWRjWho
 yb1IGkHM10ww/c8a2SlX1cUmpXpXmNiS6jc0usi+JVcSlbOYitnEPdmdkm8cLcII9uwwlbu5wlj
 vcl+npp9PRcTKFEoj3v1CC1Jt/zJOKYvqW78I6zxSZNNo05jZewQs9d+o+nYFQeU/nqSHJ/MWJu
 t0u+01XhPmwhA5hTZysmn+LJhlZf5PVY2O1Zej9icRs7Ya4kaDsCGFyq5bn2K7mfdrFm06g+T0Y
 BjBTkR5bJKLQGqVs/9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080136


On Mon, 08 Jun 2026 14:47:00 +0530, Wei Deng wrote:
> This series enables WCN6855 Bluetooth on the lemans EVK through the
> PCIe M.2 Key E connector + pwrseq-pcie-m2 path.
> 
> It depends on the "Fixes/improvements for the PCI M.2 power sequencing
> driver" series (V3):
> 
>   https://lore.kernel.org/r/20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/2] power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
      https://git.kernel.org/brgl/c/bde2202a2fffd3137df9a0b4b8ffd8a44ef316f6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
