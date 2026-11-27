Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787928;
	b=yQkcKxUlMT0TI+d9dGXrf2j9BjV+DUejNEO20SytuOO0JikirO639Lmz+4ZWC1OzcWEO
	 Of19IRpnrRSkXCMWmcgg5fpIMBr40zfk2ehuMry8mCyeBLHiHIw5TfFnQRNsaul9OWv9B
	 0CpUvsbr22UcwOjdh4GNM8wZlgMayKBiAjOS01mF287fXiDDwdvzAw4dJ7jvOrG3aJRZ1
	 O6ZPbFPcmrH/LigIyXD42PLetubmUvE2WgZGlmqZhkOC9oqKTmcc5pswlZYPK1ScKF0B1
	 3RZ3gtcjg8XWo3K+T+IMDDsDZkgbgSSTKsullcprYKK92j0+HYGaZ+5oOXg9QAlvrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
	b=uwAClTXEiPNVDasFYLsknD9k75leyo7BD00YVULPDu/TkTDvFer8QD56myJrSQ3R3zuw
	 zAY+KWTY+AL76QH2r9hdymEkUlDRdB1QZH5/8NOwzAQu3S/9INFCY7obNzEqQ2wsZVRIf
	 y0v62Ax55mRWsXGtTKrIlyW7cMx+3MtauT5Za3jfD8itRzWVD8+EFDEyTMrOLtEnIsvpF
	 aLMC+YzGcxz2p87tUrDuoITc8w7K56Guzo3WGDM60ZMGZBABvhdhIt7HmWF9ADiubilxn
	 yYkxJgJB/B7F06y4jJwohFgIseQtxrROzFLTKX9zRO/BjuYZRmGQmhvf765a2r8/dTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184A606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3184A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDu6Af1779621
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=TOjcsKcuDkQqhKEM
	pY+66B0jBD0y+w2WuxCnqNyxwYqmtuMoZrTl0cJPLd/mTTklLplbhyMHb4TC5Wtq
	Ji2Qk2dzyLEh2cMIRuDPdYHqZpE/N6fX61D4TPWfBAqekwTKIPscpXnW+mrJEX1g
	T67dFtRLf4IjNGcPXVhIvoHFM1MztDlxyVpCMHvcXvYw2hHwPLywFmqnznbL2nOM
	sz22SEUOUEnjiVdwNO2bgpnoMVFCLggMv5jNCcGehEEubP3PBl+8lUty7whgbc4y
	8od1uEnUK+wQdjbAqIyVdpYI0rzoM6UghTNlC4hv0RttWqdHeAoj6pqD+rHn22WG
	zHDzIQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3atnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee4ca14454so324473e0c.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787926; x=1796392726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=FORsxwKQO9IHATmRZuwnt/wzNKkR76nev4Im041FDN08XKsqjU4h+VVpkDoGm21N+f
         /oeDWC7HpwU5XAoQlfBoTZucLYqP2da14CrW2L7LXHltK8zA6hgd3FYjFMBJlh7gJTB+
         iD8G6N06MrZc/leeTgaSqm4ZRHGiVGyc5hvVqtkhQ6fAsP6PylP1sFZdxlR6y/biVyvP
         6suhILDhV7T7nlzNeWh9Z9G2sijUqJBTrC7KBxzn3QJYNhf6maSKO2w+9AfKYUiOWpje
         Gc72E6kLMJgBTCsCygQSVhizKDh/Je5Hnx9bL55FUerD2pHWiPV3arEFgvFuAb+dBxTF
         OYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787926; x=1796392726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=Y6I/Sbxl52JmkQmkoAnCmppqP6Kysxs8hP+Wu9SNITf/VeSu6R6vfgIuXD56+BZ/Mb
         hvcogtraQfkPJWKFmjFACTXMYuYa7P9Ksz4LFhofp945VXz/RZdIu8qnVdyUhLJ/BUQO
         LNkyqgM6u+scXE+up/I2vx10EZQnMhvlAtmzDTGei5kGjLjx7N0eSWSvbVE7mV45dx1b
         yfxDElz4y8uzGDeRwFGVM92hX/MGj104ComSO4FbRjQtHA+uYjpH1mDJotMtMbbKst4o
         lkYeDm0sg9Z5AJKky8LfO07tccbYRbxYEfz0V8bnkA3Ny7Qwn3bEWPfeKot1VLpdzImn
         PmdQ==
X-Forwarded-Encrypted: i=1; AL+hErF3ZLQw3r1JF5xl5lqbIqmNijHMppwMUcOAyil+h7kwxPdZ0i+kxDszKKhx+e8eN0sK3UP8A+7459Ls@vger.kernel.org
X-Gm-Message-State: APuU4Z/CT8U1lOKKeX5rWSNXJ6yMK7NZEqtVTr46hG7auO1EL23ezWPB
	hqj6idHTQA+mmiLS0NPQfOlPzHOoiuM94/E8EWWPqYen3rdYoog4NX8HesF4RqCSe7NI8XETV2u
	Vtg1ryh5+I7CgFawSI+v0hCcMGGI//m35cZnBIAfJb875kov2ImDrIBdDtw7Wdtu1
X-Gm-Gg: AZFdTZcSnpJUK2hBghyorliPgUFqYbfZOhPfFFk2XPpdmkhRseCswQuvGGuy64g6PYN
	9uX+zT7xT9/EZxd5YkT69jBIfuRBNLLcDoktQXWlTzreYkg5xlSeNvHaJiDDzr3KWGgvQr3l6/h
	4CFSJJcUhc2IhrsOBr8X11f3YD7vfnlMh0cS22cAIKy85LJcEZlANHHAXV6Ll7dS0ImkOzpWTUR
	Jx7zeFvpsy7oMrNla5mzSOO9E0XiuGfTEqpCP0rmcdStgjR8GKtK34CTiamc6csr1+G50VNe/X5
	Hyvi621bm/cSeP/+4BLqm5btayuWCOdwqovug/ORGtgEfYq8OnWCeGm4UPhA4dzOrZGVIRhwTjO
	IkzLXJu2PxxQ2Q3/V6/NBOZom66mqgRpSHNH984mxHqeKVd2TY5v/HaTCuaOZ2jPSgKCAgq4=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434804e0c.1.1795787926219;
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434775e0c.1.1795787925770;
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm10578803a12.32.2026.11.27.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Message-ID: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:58:40 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b098c97 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: yhw3vwm8EmSLXcSR-at9Plb63zM44fXm
X-Proofpoint-ORIG-GUID: yhw3vwm8EmSLXcSR-at9Plb63zM44fXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX2CWcCfko0pH4
 rg8wWcaR1wt3pRt68IVDPcYk62+j70rkddTY6r4/JzvuuaIep3XgvyEyy7zJNmD/rfHxo2jE8hk
 DJigscZMySs52kTmRY6c47G4uqK1SsphQR0/wZd8aa7Gn1jv1igesHPkVnl34GrN5QTeDZFFnex
 1UeBj8uEc4Ci2pmU/8ewldOKSr/odhKeL1jE99Ljvy7MZmiAmhUc5k8/rgIc3MFpMa219Dm41/D
 jV+kKEkXQSQ5hNDxYZinUdU2hL+HSOJkCQmSYlVjCXtEWxvYhBLnU+w1c6rugGZMKYGdLBjrzab
 7gsLoojUMT8tLTJDiNKQ0dh+ym+Z4xwJKT7N8FWDBQKZYn8Hzoa6xJnWor75Cn0u1vQMlQsy6JW
 sHiHzTqvwck+9o5Wk7pOcEFeUv8a/+XE9A1Ri27bSxisv+YG9EGuseAYc41HwaEXlaG+/vERMwv
 4C+0bsa7bm8qNEZ4JsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX0lJ9JalnKgiB
 yRbj9fPCj3wJ4Iedg8RD7Ved3/Dl1FkSfKDOjc5CCMmVG22Wj0P2G4H9t9v/R96p0Zp6uMVQIA1
 E/kgYCM8lLO0Xf8BRHJODaoBvx1kOOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
