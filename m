Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105991;
	b=hhV7peSaAKVaIbrXA6V95Jo9HAoiCQziHOnApl7jCyAHDKxwCP53vZCEtDPMC7D8uzXt
	 uGOTFOLqjIR1lEmEqRxwfKeDKU7uP8+bcVzLMscWZDG3TrkkI6eZtHg3GHcd6Exh1DTf7
	 l3RxUm4gUB5reuZd1Jmd6aVHXYbfd7bfdwRwGw7e4fJw3TDT9EPgkC/01U44mVHWFmHme
	 P1QI6izpjL9BAGp82tkhIbfDCEZ34HwiU1Jt2/4leaVxpIZTeqE3R02ZSYIF5KA84p7nJ
	 5uVqvO3bMxn1e+jAz6//uhNIFcsD/JVjxySkwBaZthxFC2xfZLxz5TyFHroGTzqBCwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
	b=P1i2KtTDllurftFATueC1fOpiPzc81sQFYPNPA8+Pp14ulJEKMs9gmSPPelTlyNi+Xnf
	 VoOnHdGouTqkica3riXLsoqqKWBkykjicblWa9ul5PcRuLKgCJJmvWRfG+p5QPhD2i3Ix
	 /iRGuVmYVbub9NfFbEze1X9iE2QfZmKlSTy0IuNIpQlVOtX4vVjqBXQvwBqnFmDGPsMTq
	 cphvYngPpsTEfqj952rg3urmoPxXVRuYZBqoi0YI6dd4OyDgLFV0wgBcgMk0z8Y1ArolE
	 x8vL3YrGkuA6W8EGXfV+uKuX+uRYy4Ho5s7SGnf9XkY+TR6XrkHopdma4otPlPW548w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C000606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C000606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCH03026388
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=; b=Ui885gUj+bWI4Obz
	FzAbcwkFkUI6t9drRFkPFpZhgb3h2gcH5tCHP5wAncNb/E55O1IIueNEfnU+RqY5
	K/czRHq3hsydzTPh8LI6KCwWPNYhQAwOWjWOFue3hltVc8UN6110CMEcfAsm1vxJ
	hY8LF/kMUp+2V8MY3yXEJNidNEAsO683FzEg2G2hrYNVsen/xMUDD6SDNI11Keaa
	63IAqGQ67MvOmi3fllOI6fmkR5OsLGPnOygZIVkQxerI+k34gyS7Qau1FwSbvPPf
	+CTXjErNZ3fUWI9fUEh7IFMdeh+yMT3UcVqdFVVDbEGkXPDKEAqp/TNmjotZWhpV
	eagBrw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91aj3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82169fb66c3so11017857a34.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105989; x=1793710789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=KA02GGmJFiToXYtilHil9yyy9MCX6g3bEB8kUhtF98SJ+41Z9kwJFdFSmrRbB7cn5c
         0I2O2mFu8Aat7iTiGa05Xke/iVzyVXEr8yCzyWNM9oJZeKf/gSiNGYcc+N67UIT7p1mh
         kmfeHf/KqCtJO9rup2jktjra5JHjJac4AGbVCpTQ4AcfTeAreL3KOJ8xZCLFa5S7y+Qv
         +p59c/bppCV+p2vt95Vb9uAAfGnCppJWzoDUwyRpsiMCyd2q/ImLOOjrDqSeuKKpCieK
         ZHX1MH9pSXkNX8/RdaNLvIoBB74Kmhf+7RIPjtAOqFaw1tw1UpqPx8S7zTPOLaaHQg2W
         ZQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105989; x=1793710789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=fk0JGu4cChJQa1tu/WNoWpT6LLtOiraddp9Cqop/olOHnKixBszlVHeC4s1+2lT+Ba
         nUhK+8M7nTt0xZa1/7rz7bY/eK1jfsf9HMcM1AkKVYh0FA+ob+NVCZVhJ75E/VrTqiLy
         aB51N5f/zW8gCcMuUnj9ULotkqdt3h1P9wDkSdtZLYAJYlv3uq4F9atyIW48O/9j53B5
         CNZCv2zZ3Uw4ogumFrnq8DcnHpK8sGn8LNciLkkHlNZfbWRPzW7az2eDF654HN3siCbP
         YGXw+exK6PyQtCsBPiVJG2Q36n2hxNz4Yvr0KgxfKWgvRkBQr9phYbtUzad9v7BgtvPf
         tyNw==
X-Forwarded-Encrypted: i=1; AKwUvBymk7wTU7rayC0elSEt7+B7K3A6sGIvEoxBgqvuQpibCcV/atz1DPvrpjdSO65LalXiyKAc8nR93fWK@vger.kernel.org
X-Gm-Message-State: AFq9FYIhGfjxH6n92aa+X6O+Cf9j6FrfPQDG78q0Agck2ndUWR3TmwAI
	i1rawjHrmo43PqDTOIrStf/jyBZcOBRplV6Idmsrv4XjWdq8+ugExgcUydo6r2AKUkkXTmf27mj
	xK1VSuwMhYiArzMZanmgnKf5JKC5gHoddrqWYaIChCVsifC5UyNrPDllKF836eyJN
X-Gm-Gg: AYBFou02xCSkP1VvvjPF6/TT9JCdPhExfq/VSH+lPUEpZ1Sdpkgm6VpRZvas/qXyJKp
	XS2x/ppfdeKY4A5E1+k3s4L8aPnhjacShweEnPwXBoMd7DaQBd6hvodmOEstfiEchjg00gbX68Q
	9TU5Wjjih+06PbXz43OcnWjeNFUUDqWIHJzZvhkfpE4a4MgCKscMrzU8T4tTGTCmV4ZIcpAYo0e
	XYC7AJQemhjUMb50a9+r/dbxhVg3TVmt8mtoZ7DinoVdPT/KNPZR3LNCRVQleShC43Oqz2Ow9HV
	xmb1aQVxNPxotS9BKROLtVuslv8SRRzSf2QN2i+182C2I5yOAZ95DhvjTbTyPWVedQJNtmOwkft
	cN2d15qO/q/VPJfplllS4Pg==
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480133a34.18.1793105989204;
        Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480109a34.18.1793105988781;
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11174684a34.24.2026.10.27.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Message-ID: <7d9112d2-c588-4c37-b6f8-dfa1afa21ed6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:41 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
 <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FR5zaVy5Zq-okz7cSW9fzPuYms7_rC7A
X-Proofpoint-GUID: FR5zaVy5Zq-okz7cSW9fzPuYms7_rC7A
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a046 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EIM5vv4Rke_6-YXqskwA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=z2U-W3hJrleVIN9YIjzO:22
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX25D/Xoh45xoi
 /nLs6YRZcL8RKs5FC2giyjxZrXsEV2YxRwlnwLE4Az3xV5DaORr91DdbC/DgXVmYQV39DfIlfv+
 pCi77PHITcqJ+qd+98LJ2q2jH2NL43nVa0x4wBlQ79qBKIWXmfPCDVRG9Busi7pVqz/V852lhf1
 FmL0pWYq6ZsOjMrmHtdDeU2X4Yc2+/fpC+SKKwGYZpcRF8L20iiam+PyqvuU9r29UqYggyLClMf
 uf5Qq2cx8Vz/zS5wLiTOIx0zvbhK7/xKpBsPTaKCgWQ1dOOC6KSsMhgGRA2hs1olxix3zYRMn6q
 k18aSqEQ6JsquAe5V/MCv4EtkmNW70uvK2i20CxDIkqH3W2CxRWUAiVvr1m+sO6qm1aFuHKzIX9
 tNaR1mnB6X7XZcwKQfjIEgQr97Djwj8ChN8sMNnMTaowwzLORHeObPYxSbiwY2CZV07c84yAqw1
 dbDzNLz25VpQdRpPYPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXzbYPKS9XfLFo
 qyv/NZjxoFdg/WBOqJURzRoWBFSQ5cV+v+LMe8hoQKlLRdDkUqTHh88O75slCH+dylt1hq+Oe/o
 k3ANLISGEGXAW3JBXL9qjOmyN+eexYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051



On 10/27/2026 1:59 PM, Prasad Kumpatla wrote:
> S16_LE was originally added here for compressed playback ( https:// 
> lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org ).
> Could you confirm that compressed playback is unaffected by skipping 
> this constraint for the MI2S and DisplayPort backends ?

yes, this change is made after suggestion and discussion with 
srini@kernel.org
