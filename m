Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA3238C0D
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774157509; cv=pass; b=JWDUWu1BpT/UvPelRLwhzsp2D32LVPoZw+xLQ4I9TeexNxDUeGXLbolVJC/FinXwxR++2Kc5PdtbxK1m8Ajej+H/amwUaU/5TcXtuvYwMK8VSnkHI4Ly97wfM+4MyRA6iELMVWvDSsHj/fRx02TT15iY+kzuvP9WomVH4LhEhD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774157509; c=relaxed/simple;
	bh=KXSs/HcXhWiOOPMswor3shOWBLzA140o6i+GUpk9QS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dok2jfYEke9Xh0NnTced+7vMU9gTuJaRH7yWN4wEaiIAqg1WE9aDiIvktEs4zucvxS6471ykXaz/B8B/dgS4q0SW5I9iSFEg6jwWkYrVpYQjWITwQkXDJW2robjTVAvlHZ0/PCyNuwUsT9Kt1Z97pbSN3Fd32XCw7whcEUnrzK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYnzp/4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzCRtYqp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYnzp/4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzCRtYqp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LMmpoa1975806
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=; b=JYnzp/4XVMdkbgnC
	Ue3e7Q2azYQ0ehRD3mX08BeSOxwqD+1iepTPeyBtcRg23ixOXAXzcPRoRZAkkNvS
	oRJGyQxtbvBkHwLZ6HMA/YU8Oszb1H7GxOmY8S4ldynUEZvg94dqX35fn0LrBWsz
	bj05Duhp86cl5zD745UMyTBj2sovnfu7rQDJhrcvUCVDTLNmXYLwX5IMmB4gCHaH
	+SH56gHLzBLk6nR0F09zX8n3Zh7FhmlEeiYTa0xi8tAmL6NL5E8s90hNFAHF9W8+
	Wxviw1cTk6QjC2oRoa8XGBTlSiQsxKGXCBSeSnSNfg407zDIqGOsdCq1HYEYIERM
	zv4IDw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvhwdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0cb775215so68486135eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 22:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774157506; cv=none;
        d=google.com; s=arc-20240605;
        b=LUiA60XnjspYXPc5nxYBgT79RAgnihs16jo9PaBzRkyXA+p1yhzxDsVMY4ZduTI/1W
         oO6axP9ak5OjEPY/5Shgv2SkXkAKHjI3gvzgUqbdkyIKiSVvUpnm+zsFiTWv64LVdNlC
         zabLxJkjvoWgU7QJBl0y5sju0c/dEkg98cA6IURxOrIDU6YZSLEOKcUJDUHmytXaskNB
         XkJx8G3W3FG8weCglGvo6DhIHkNk8QWiMn+zhB5PRTrjKUe1L5Fb80QtFNbUIbNWIvdO
         mPk1sI4nt7xPoJ+igMerjgeSQh6yqsLn1TZ91ko+c545sS8S3HnK3YqBM1FeRl7jbC9j
         z4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        fh=oNSg2j3a9wxL81Safuyd0eLfa+wz1u0Yw4o8+68DHk0=;
        b=VIN3Q5ngNfsZIkFCsy/pg5ikYW2fehFDxBCkkpAOhbeJbEloE8s9PFi50KLI5vS4HW
         vFG6ul+5I6ID8cK0wLGML/SlpftJZMGZ1A6IaoE8brsWsQGHKim1mpcx2p0iB0pa45vL
         +NhsU94JLht31spU8UwOSC0Ac3EX9Ytm5+g3goQtdeshnN2m6qP38qwH336VZKE7LRMH
         DsFpSYqyu2wUj6VUBznfjKLI2ZRJkF9XMJvc0oIQroq+EYLyY+oGAOW7v7tYRuEbteOP
         Nsx1Ge/5kkMUPUfkRP3hQtCoAsUNpljHMa5u/H02VGsYwjRxpySZuDGdHZ0jXh+FrsXE
         Jq9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774157506; x=1774762306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=BzCRtYqpHUdteTQMrH8UiEJEpGCys5keMQz4Yy55lDlUR3K2EnatCXSznyjDf5lb+o
         4h0yiyZ+36luAZqV/HHBBpva0kIVyC2t76qIndodohaVAgH18udQl5kHffGHlhb97Wnm
         mjT15aqB5Ouqz2O38GGPYPBrM4o4MV+SwAPxyqnmbPAAlvH4Of8/97VXVdMi4d2/C6Fq
         OvqQdjlyQ/Ljzl4xytEf6TZRb694Ne8hqRnItCM+vAlk3jFw2QOkAlQUCsjjXWPwLVkD
         roQL6/3xXWHStp3td0kbrAuuViOSQPvdMoPGwXmqF33F22CRPUOCaX1Ue2dxtsboAXo3
         127A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774157506; x=1774762306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=G9Q5XNj3yM3ELc+LCU1brnPQSVED0qtTmNn9UtFQGTtT71BoSRpz11XJ7HEnoncjaL
         lGUr0jH/Ey7A19BYxPaFUeJQebC0Pko2znSvNXAEQ7jDe6Bbnfix0iHARbG147xO+Q+f
         F4XQPgEXPma1ZBJKtRe+54dKb2zAvjExs09+x6LKL0zYnjgTSECYkExyJuTB6bB2M5NK
         OHbJEnFEIAz6fyoPtMbZv9pl1/VqTcwqPRa6uzBTjwrmKNQR5puskIVUGe4jyy2BJB7R
         MBk06XecfGGHWj3cGIgGzADYCnyuDj6QBJy8nSwdvHMKzQLeISgAS9kv4PY9wSjoUgNu
         Ta8w==
X-Forwarded-Encrypted: i=1; AJvYcCXY1wlLsUj7+zz7iZZ6NiV6WKT0UIuAc7yWdnqFzeiyEnp8AAdJoER4AqxSCYePVcaIquNXYP/M4TD0@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeNK8Q0ZmJKdA/QEkdtkjZslUXzLXmo8qttmD4/gDSYNokldC
	/IJFUztmgKK1ttwtz/E015a3MQWd6X6ZoxKg8BCkKsDRuhao73iRm+7dYrydkuZzf8EADhQdqsN
	1mRbH5TJ7BKIQDSvniiu8NTqFO56GEz/tHKpCw/H6lxpHHP4DJtXjyNfzUiKCDK0J8ihuEygPJ/
	0wkYhIYp3Fwdt7d1SxbnXNzhXYDbx+R37OchD6q7I=
X-Gm-Gg: ATEYQzyopu9XMW/PapWSV6V3kG5/po2etqDzxcksUA+kifxfTuNs68e2vhTgSJMZhZd
	ZYm3yUrFfMEMi/SWKh5WaWUmAfT9GN1x1XrSn7Apec6MhWDheik2VZScPfO42lLnC3gfE6A4o/1
	pl3XFMEO3QPdES22XBBByF3Wj6CO9s+G/KUInn7PVrpsRCTb8YZkE8dOUUDIh4CCB8grFvPe9ZV
	lOP8KA=
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c10962a891mr4064912eec.13.1774157505609;
        Sat, 21 Mar 2026 22:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id
 5a478bee46e88-2c10962a891mr4064899eec.13.1774157505124; Sat, 21 Mar 2026
 22:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com> <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
 <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
In-Reply-To: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 11:01:34 +0530
X-Gm-Features: AQROBzCzhjx0vKHwbPAUpiSfar1k4cq_wVtxI0SjsuisfOaHCCYWgZ9iiMzXYhU
Message-ID: <CAGptzHNyV=cFRyk=K=uXt+Jf5e-ONec8ih=h-Mr2x-xo_bmbGg@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDA0NCBTYWx0ZWRfXyE1G++axI208
 bLXIdnmLuThb1GnqRlPNDdJq43JUmasQFLOnasOBkWLmTe+dbmvilo7C+iMl33tSgfcAPkPzXWU
 cHpYyePR23xXieGZcoSzYWDZkfb1EEUMwtbBGWlpYP3LfNMxhmf/BBoI/QxJIJ9cfEjPI1IdyH9
 079Fco66+ZPL1X9rlMAj5c2ShDZ22/HBPF7QssXQnYjUbjjAP6LVdl/aMe/bp8YHrHIOfcDoIuq
 nA0+LwfelOZZ7TutScAyILrHJKbBN0yKemJtZrSdTROSKef7nqeo/rwRoiafSemzDdWCwItQSvr
 Y8ejLb1bW8+6rtx2HtP285wsm56e6RBRCSVWqEYFWMUrsKQ31FgzBLA/umj4P/7ftgLoi/ZUNKF
 vl9994fWhTXwz9jTz1BaLj6+jVRuQFauV3RbQ7NCS6K9KEOUJH+EO2AdCEws43U2GTJzpBZcKd+
 dK4xNAbAoBjT1mqhmJw==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69bf7ec2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=CIsBWlCQImJ4_lLhEykA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: LyiaSTnzGAj-gF3XKX13SzfEjB-YM645
X-Proofpoint-GUID: LyiaSTnzGAj-gF3XKX13SzfEjB-YM645
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220044

Hey Konrad,

On Mon, Mar 16, 2026 at 3:05=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> >
> > On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
> >> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> >>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> >>> rdp504 board.
> >>>
> >>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.q=
ualcomm.com>
> >>> ---
>
> [...]
>
> >>> +    firmware {
> >>> +        optee {
> >>> +            compatible =3D "linaro,optee-tz";
> >>> +            method =3D "smc";
> >>> +        };
> >>> +
> >>> +        scm {
> >>> +            compatible =3D "qcom,scm-ipq5210", "qcom,scm";
> >>> +        };
> >> OP-TEE *and* SCM? What does the former do?
> >
> > For OP-TEE, we have use cases like getting the random numbers, remotepr=
oc PAS and few others.
> >
> > For SCM, setting the download mode is one typical example where OP-TEE =
doesn't come into picture.
> >
> > Please let me know if this helps.
>
> I think it does, but it's odd that OPTEE wouldn't handle both
>

The SCM calls are the ones handled by TF-A which are usually referred
to as SiP SMC calls. OP-TEE doesn't handle those SiP calls but only
the SMC calls in trusted OS range. So yeah both nodes have to be
there.

> fwiw +Sumit is poking at OSS firmware for other platforms and may be
> interested
>

I think this is a WIN family chipset which only supports OP-TEE by
default. In the IoT chipsets there can either be QTEE or OP-TEE and
the bootloader (U-Boot) apply a DT fixup for OP-TEE in case it's
present.

-Sumit
