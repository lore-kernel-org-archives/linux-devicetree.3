Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228420;
	b=knnjlF/CTxEBfPGf1ZUl16xfL5MaqbV/AQX4EmE9Ih+C34uaPUaLa4pO8C2Yi5kbh8aO
	 a0uE/hnO6HFhKXileSncEN5mPORO60hRys8ChCE3yStFN/NyZik2W8oRmGyzqd4DknDqQ
	 2Tq4DRvZ2TD5w0Uov6iaxAo5Ru9jxbzcRdxLgBABZhHoNSJrbsjbsP2GBiYnDYsVDZEqB
	 DVYdTALIO1PfzbUZkvks+l9gChMExFCA8ZZ76KYNrCFZRR7bhEOeaUSdeQRu9CvKtZul0
	 hFKxK/BTbrdoS+UMzerNO2Pqb4QzEw7l74Q5hHQoaqBFjW39b27iKEfl6GEyiHjasxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
	b=RcFdgL87Co7Vqomo8ESEWURBT9WZnQlGtzszfjBgo/evewafFjiTpF+CwUTO7BsBLhY3
	 w2u+FcIf6NgRDLAOgyOhjU54xOU7p4XONKi2lE0VI5S+v6S/DHWn2rMl8l0yNOZRRd6RJ
	 uBqxH3Xf4+Pq1tjEAmD/oLL1DSvsySFLnUTB69TmS8+h+lix+6cXHvPdZV0m7fOjJv/sk
	 D7cmHxUZ6UCd1yq67QIgqxSzuprjLTYXFu/AWnrGgBdpvpF5FsAnAsi5cozEAYW6J2eUu
	 yHYr8gycs7oUs69PxEHi4wqOCBOyhpSEHDGt4ZA/vWbT8GSYniFQqvGhvYtCZ+swb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032DA606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032DA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ukiQ4130899
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mEue+rSQb3nzOUHKOMWWZHCV
	p8uvI1D8kOmCoL2tqFA=; b=Qz1Ad6FidVrJ8nbK9hpcuyv9fQlFmF3jlggJ2kOM
	AOms8H7tNY313Zy9y4qWstid0cyX7p31yTGEIpZ6PIhiKe0cu0flg3Me5XqHOx7I
	B3odHkHaDOMOnOnoq66TcOnzMUGHwmcp7ABZvBiRy15iU/+agzdsAK/DNMzGXks9
	UYFqRcpQPXkfpxpghInvlSCLWbi0D/xKbB54fk0+cs+7HAJPQew0SzhHYdK6YCO0
	JRF+vk/Vg3hphgYcEEM0nmbw6uwY07GON3WE9jKzrVlCqOCR49tdkqffbWjFAkzF
	cdbXhGgENAk6uYDIMnH3NkQxcFH2VVFHQHuCD/D6M93EBw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hpg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:46:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c83124d530so1019125e0c.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228418; x=1794833218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=gXb3p+EMOx0yPrhe0iwTxJC4dCdRLQKh2RIMhQyQbQHx8YhC9VeZpRCknJMJX/UIs7
         UHbXWUhAT0RHNha+J7cbLILcx0ORU6U1ta7SF553ooISXMgWNyc84/fmfPuffiLolVhY
         1ljUC8q49SSAEi2eZeRdsrWQe8Avmhr+7etXb9o4PRjZSVVt0sygoDnqggQC9N84kuJc
         nzstmcN34oD++PdvzeULqm+XV+V+tM5ABjPl9sOMegdfzFSspMvFsfxtWoiiommqynAz
         lrlAckVgFpTMe0Q2fwhZ3REaDMYRcJXLRkr+0BKNbwUpwD75zMlonLEhFWCQCiVCTw8O
         O6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228418; x=1794833218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=cD2icK457WkuolEmXh+4mZq8L0g8Jm4HNPZ34A81aBkQrYsuJfo0+4Sj0rg8Tf7RAk
         9mPu/LGBUhYao7vh1TBKmydktEnCbjwdAol+PjidqmAqpveP3WRCWlX5lZV6tmSigdCI
         YwgP3wpV4ZdaPYG9v1T30GQ2Hh7m48gTDF2mlpaVJhx8bo2blDiHbFwiyaC30Ysv1AEu
         h821AWX1otkKew9noYjuJK63L/TjBN9+cpuj0SrHf/uyB3t8/GSdbcXDWtguue8rQph6
         7cW8bnw12OkQ/eRfXpxogxYAN+LNO1zmVzvktwsnV6cSKWm0VCAYk9tgwT0Ndilbj79v
         Dizw==
X-Forwarded-Encrypted: i=1; AL+hErFvIoF1Bmkl5CUUDhYYGFwcORN0YJlei+CgetPUte+dWPA+1CRW9Erm/FzZ/v9B7NF+5kSquogYpAk3@vger.kernel.org
X-Gm-Message-State: APuU4Z92wnoFX71pDAutH6AflQLoF8kkwyKLtHjQE6qThMTjSJ71mmju
	n6IQPAILh2ocRhnwoeE/ijsfZIBjRJ0fy0dJcFeBUHU0quWYQCUZb2ewwXBdSWezhvZK1W/3U4U
	0BHTAVrz2w3v29EteLbZq6BDvjYW3aKCS0rlPEXw0rtb5A+Jk60LEv+rUYMOQljR1
X-Gm-Gg: AYBFou1H98d1GcJoeeQ2t3649ziQQNvQ0GizKRxEsOUb2K7g/0vJMGdtIeELHIACpiW
	nnYYrLPawVlPb7pXwN+Yo6D2rJpNtlXwqyfpNq+xi4U/sAZTcJHE3DXpHA6Rp+5sLwGyB9HxUIB
	QV751Wu4C4ax9sffyb3tlRxOLK6CJJHRxEfjb7zCPZRqVWIeOoCosALCGiSiR+PuEXIe1HoDnqE
	hhCUBjPrdnY8rvDGOW2XYdfDGcxWNaZicC8LwfxF47ciOV7IekG69a26wX/9OTELyBH7qtolx0q
	XfLEQJfbgQhWbdfK3FnurNQNgZ/G81G9VA3uRkq4jOh04CX13D27UD0IiQ01F3Ach7PUnzezWOp
	lox9nK5md+WhysGqi3pzXIEobJHhj8MVhvDQvSj39tJF7tR05TXuNTxT6ETuyACs=
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094403137.28.1794228418099;
        Mon, 09 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094372137.28.1794228417406;
        Mon, 09 Nov 2026 04:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm539537045e9.3.2026.11.09.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: sdm845-google: Move panel
 pins into common
Message-ID: <6hk3vbvxybzrsb3nli6ysdabeb3npcu3ejozhz4aerxaytjjqu@dfqjpnufsa3t>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1c0c2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jgMgYrHaTVL-YdunLg4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX3FBnGGzHWd20
 61Sb4yLo6fPMuNRucI1ydcn8MkPturm5snNlpFBMag3dl5rl40st5va5xqxFOinm5haLVkTCB5R
 s3EwXoRwAu14fZvilMIQ1rex05XFGNfv7P6klozckiud3pR54U+3I4QlXvcFSW6KrIhFkzutCe2
 8bsWQ9bMTAR/5ZhJ8ZeDc1TqNfGAh7AWx+AgAcU5qNQW/VKICk00d5/g8GuStdfaDjyy4tNqUu/
 a/MyblmyP/usRvEsJ1jh4PqMqfyRC/q3ZdoxfUtHIHkbM3TR1N3cYGjFZbMIskUnZT423AAq+tT
 14nyPjAyMcXhO5MEMaBTnw7wHznEc/CHU6B2Fz9bgQ+TrIBayyhJ3yW1RYUpfgHDn/+rc+Y2qv6
 q+NfELk5cHhpGnNfQoKcbYOEzqRKXUiGpm7axvCHT0foLLW3j2/DJbPMSyyqy3+dHZthzXOAjLB
 cDm1ikaL7OgKvqmIobw==
X-Proofpoint-GUID: 6HuC2ioGoSGji0lVNM5v0scRa78wz5yF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX+LZ+bKbyKIZO
 TDTzOJq6PNzXQdJr61QfLM598R/G96faKYD0fXl56+/cZtvCJQnhQUWI/6ckIczZD/FUV0BRYRK
 aI2MqzuOUa8/QeQRRmeJ+C3y5VuOD1A=
X-Proofpoint-ORIG-GUID: 6HuC2ioGoSGji0lVNM5v0scRa78wz5yF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:30, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
