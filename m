Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187556;
	b=oH8a0EBaC7q3YfBKhOmPHJ903Hj1KwoTGQvKfi+dMDKk9e86PZ+S2D/OAlMeY9hPwErg
	 v209prAr1on6cAv5PIiAekKRdeQNeKmFGJMcc+XCed+IDxvQ+j54zbIPv6oJ5pe4ueUj6
	 vhOZOzK0yjpAO8l6cCG/bBu+BMdem4b1BKO2GbAdZ+pAkyZijmyxyd6tv15Zup2p0ZZIg
	 c0dtGzcWiOkbCdMMR1gCnwLixupVrGRZ1fvcH7pmV4Wk76iCYxsoLdTivdEL6Kl6mjbDV
	 EPRPo+EPoVzZgCrSlUli8Kp2PhK03/CtRsO2rUIdbHUS/g/hMonb/qsOn1a4EomQO1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=;
	b=TbC2pwC7CXN59WLKdB9kNJ9fyhIblckPAnvHIdWgldaWyTZ39aTg8yvzLsb8iC0J0417
	 PWbzEG/sMOVzkXzUifunzKlIY9fXU7WKivab7mOQjqAb1UdgrA0tP9HtCrOcCRc12AT9l
	 niwDmUB/AvbsB0ZH9Z6aKKOo38Asvx/Ac+upzCYuKMR3dj9tWKPJvJuXhn3OJm7qLXxvm
	 VEip1ZiwnKOWsoPaSzyrV64chn9pbxl62zR7lb4lFTjbRR8bPjIYn5ld6pHAzEHhLO+N6
	 QujTrMa439uBZw1odA8r4fKYGV965sCTKhUt/kU+R9VppbnDtVbl7dOaESIGtwPwo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTh0kznI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAU2oGBe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C6606A7AD
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 01:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013C6606A7AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTh0kznI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAU2oGBe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Go8u1922656
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 01:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=; b=eTh0kznI3YTFuB/b
	TYV5wdAwaJpoMl8Qq2lpa7xXNb8fpqcKp2040mEU20Bs4/aJTz4BBYPanA/l/nht
	cwrODVPUjqyIGPO3NblEUM91LaObZraue3uZdjOUHoEIkQ3DpUD87VTIeIMR26kG
	00/SwtyMl+/q56NHDAJDHQwwWadn7/NaNX/+k2DTw4BmsZV5tM2bLRWGPNMSKdhr
	owJgenAn54eOm5PeYsM1ltvAjWB61hAz2n10H5sRIbDNazw/Rwh6etm9wahLi0T8
	Nw9QQxTIuJzLmfABEAxSJXTCvnuqsG4AvLsF0RW9v607SB5KNJvC53kb6UpLXy6y
	KefqLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ky8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:25:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed00709df0so3580415ad.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 17:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187554; x=1794792354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=;
        b=VAU2oGBecmOUV0TJXrDZHNh0tYVLH5GGPttV/1KqwwG4K976D4Dy8YriX6nUO8NYhA
         FN5W5N2O13iGdVOeKiqGnrsrZhnxVYJ8K5Y50uLJke9bvXewgmU1mNDn5e3xJy3lJjFm
         eE7XsQldEiy58pgWRmY1byF5SVVzefpMyYnAuFqz8plRyu8UlMY1dzqI4RZE3jYKk+FX
         ml/ve1qNNpJY2u6ZbLLINbNOMqj38u2lk9cOYp7JnJSZ5f8By8zVGznNcI5liqf/OtYr
         REOmKKW7dxmaao9L6IlW+Y9N0t0xf2v4rlaHvJlS+RyIlwTrMNYx647lkm/XMrbH6IvX
         dcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187554; x=1794792354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=;
        b=IKg6wTF79y9uX60SRIqJ5T13Wq1Fw7q6gw4wz6mchy8WTz78iy1KFrTazQrQSZXrBw
         3rS/m1T00guv1yJMoe4D6TdCpJDIU9p/PtI9TuBNXHBjVjn+QG5NN0ceRXdjx5bbO0H4
         H8go09pBMZOONYt00HWxICSVdK7nxaDlYS5uEIPRD+IA/KcP23Z1otQOZ/BHO0O6ExqE
         egEp//qGD44ZVkeHSWt/rUfJQawt8Pzqo++gW7CngTGNdZcMh9IKQuGxSWHfUY97jwc5
         nbLPRBgmC3Sj4O90N1wOSPJdif9RKPt/Gwh/WedGFYX3zUuBflWUF5Bu5I05jTg8U7C9
         tD8A==
X-Forwarded-Encrypted: i=1; AL+hErGD7kXGiDAKNvGGS+QunqXEyzsYeWQd1SXrG6i0srzKvTsR07cuQmjKr/c4XRmg7wuY3rNDPhiWHuOF@vger.kernel.org
X-Gm-Message-State: APuU4Z/fNVQsAlAEl4uEOtancH+XM85zXsIQEYU4JGbvxoxq3O+nWSNa
	svnSlk7Nt65B1PLb8oAZFuYI4Y7GOfAYP30lzSdPlSM2fieQc/0J4IeyvyHmY2ABl2leKiX/pI3
	Ye7e4e25FZ3mesWVaXAICs0p8wAi91l4d+oRcM0oOskXZFHr7lLnSFt2bUZbhjkDM
X-Gm-Gg: AYBFou1qmyyNvbqKSF482cCHEg3CruTHg2M6AJ2caUsZ7ZhDr/a5oowWs1XJbemGHN2
	BqvWmVJ2Ertk7OK26cUiN0LUfP6vHtJ6UXxAPwNqUrGjlq1MTNAtM4/evcnvPxFkFtm4C6rf0Xw
	y3iJSnCugw4wI2RbrN64Dn6/kiQU/wdJZxiBKtlfjhyySYNI4sFYFiOy/URZp01W09P//+tMLgj
	t2jq8rIfN6VF9PMdcrdHwPGHXCpXqp+gZywHYh5o0nZhNpTJkLi07lwrZYNyeqjI766f/FomAp7
	jYhYSxgCkl7QQH3iPI+MiE5zymY4hBjarSnKGXf39aMSS2acAGBaEKe4lJ8KWeY/BffGlFKVzjW
	Fdg1JGidnBn3PkGPcLVzQ0crOpqmbOZnyy9jvMmJJmLhUFN2qNDG1QdRWe2Ql1CZIKM5Z
X-Received: by 2002:a17:903:2acb:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ed83777151mr25657355ad.38.1794187554193;
        Sun, 08 Nov 2026 17:25:54 -0800 (PST)
X-Received: by 2002:a17:903:2acb:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ed83777151mr25657095ad.38.1794187553703;
        Sun, 08 Nov 2026 17:25:53 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed817156e2sm6149045ad.53.2026.11.08.17.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:25:53 -0800 (PST)
Message-ID: <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:25:46 +0800
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
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AQx0NukJhWgtQWrK_i_kBQcCREJyxL7a
X-Proofpoint-GUID: AQx0NukJhWgtQWrK_i_kBQcCREJyxL7a
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af12123 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gx6qCTCK5MvWq7IvBM0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX71fctMjcffIp
 XKeW/IcqoAI18NV+r9wD5kn+J8LI+CUfOHnPgW/a7N+VoeMmJNRkuykyIvDvmAMyyZD0iFbLiNH
 uyYxFX2dgq8/EIRtfFcud48MF4/dnU9JaMKoE03E/c0cNJe4+M7cZQ53ki58hPudkXg4R2PT/xC
 fa2PwqTa+6SP2d1Pl/KmmVAoICpHZDUiICsaR3k1pJOomRN0bzfQOs8TKBbsIvJJ1h7vhgudk5I
 ogGTufccaTCBxG4KlifAzHfhWY1JTP4F/7omt3+cdPOx0C9EQ/G5XchYRWrkhNwFGn9roKlFgkD
 ane9UcQjnhuReDUZbLyRdCpJjPVnyFZv3R4MEtWwQ+iTMrUaQRxk6xpzdS9DbuCGkXJtLywMVy3
 LS5GlMpha2YTZjcocziBea4DlvmoT3J1P3vuQiDfy6OsFEaRH8V5C9GqFLm02JDN4pXM4u/+oL1
 Paj+SWRoO/Yikye+55Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX/+daIbBjrwVN
 ff9fOddOnwglI6FPru24yUZrwO4+M95sJYE/6tJbGYeMHgt4TXkJND6j2D8rorik15oyBx9biaF
 dNmddT9jRdeGWLZ0VF8xG06XTSUtaZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005



On 7/10/2026 10:38 AM, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.
> 
> This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
> into a standalone platform compatible. Without "arm,primecell" the device
> is created on the platform bus and probes through the platform driver by
> compatible string, bypassing the AMBA peripheral-ID read while remaining a
> fully functional Aggregator TNOC that allocates a system trace ID (ATID).
> 
> The series is organized as: binding first, then the driver support for the
> platform-bus compatible, followed by the per-platform DT fixes that switch
> the affected nodes over to it.
> 
> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
> "qcom,coresight-tnoc" a single standalone compatible, and updates the
> example node accordingly.
> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
> match table and renames the itnoc-specific names to generic tnoc names,
> since the platform driver now serves both the Interconnect and Aggregator
> TNOC. It also restricts the ATID-unsupported handling to
> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
> no longer wrongly covered and correctly allocates a trace ID.
> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
> fixing the probe failure on those platforms.
> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
> tn_ag_* endpoints show aggregation), so it should expose a system trace
> ID rather than being treated as an Interconnect TNOC.
> 

Gentle ping.


> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v6:
> - update commit message for all commits to focus on describe the
>    hardware itself and the hardware issue we are facing on.
> - Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com
> 
> Changes in v5:
> - Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
>    "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
>    standalone platform compatible.
> - Update the binding, driver match table, and per-platform DT nodes to the
>    standalone "qcom,coresight-tnoc" compatible accordingly.
> - Rewrite the commit messages to describe dropping "arm,primecell" and
>    binding on the platform bus.
> - Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com
> 
> Changes in v4:
> - rewrite the commit message for the patch 3 - patch 5.
> - free the allocated ATID in remove path.
> - Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com
> 
> Changes in v3:
> - add standalone compatible for AG traceNoC device, allow it to be
>    probed with platform driver.
> - add fix patches for sm8750 and Glymur platforms
> - Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com
> 
> Changes in v2:
> - address the ATID issue reported by Sashiko.
> - update binding to accept arm,primecell-periphid property.
> - Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com
> 
> ---
> Jie Gan (5):
>        dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
>        coresight: tnoc: Bind Aggregator TNOC on the platform bus
>        arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
>        arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
>        arm64: dts: qcom: glymur: use Aggregator TNOC compatible
> 
>   .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
>   arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
>   arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
>   5 files changed, 27 insertions(+), 36 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4
> 
> Best regards,

