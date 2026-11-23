Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462525;
	b=TsJQcgGmk9c6ckDlQvwZ5cWFEttDmf288XjW9I/+8bu+XtExJgIdRCmaq71FqIVJrpdf
	 uZ2eq+Zht7uezE9h05Xi9xvKCt+VceQfbp6i+86md8qwmVB8F95p57cpZSFc1wLEeQifb
	 fMo+zT0ZYx86Uy4WlrsvPrTnt0+TGvEtRiOhVLNSHxBrqXYhi1rhy0wrILFKSPzY424UT
	 /83vQ0o9Nvp46CgKtSDLkqgQmp8q8LK/Dm0fyqS/ydrJJrMZbNFoEWggF7iC5w/SMbEfF
	 bf93qZOrPY4dXdUT4zydx+qcvvK2Bu3AN6ouEpFPdyVFffOtQe4p/Sweti9LaRcH04A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
	b=aUrYkrYecA+EVLmichf1h4VZq9fF+YYu9YO+W++sdWQFgrbB6MVJmIpNUhdTaC2XrBct
	 4b05Hf+oLTcbFyC0dWAKA78Od0/lq/2Q+TbaqYYCTRvjEL6nc5fqBsieUc8AhqNrEdU0b
	 YgmuZ58/k6kGZMTTyEss78vcVxBNuuGj/PPiTMmhavVFT8abpqxT4NN0MKv9s9moIoKP8
	 J8/G0FSMfz4N3HvN4ZtdIoZ0icIecNk4zBfnK+bl6sini6xglYD/1Mc5Grvdrxm1uIGbz
	 0KPjwlPSbe8FlgUDJ6UJtR8eIo3OWXGFAnYYth0/TDLaPDtntojNGcnGJJldqHtplUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459A606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3459A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH2Vr3475199
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74mX4a3vRqZEyTV8MaSaXTpj
	++Dtm74ijLlv0eeiueg=; b=i0kM35MMHabLAbMOP4SVW3ovhIuBCRprPcSdpGRR
	1j1pJ+96IZXsT1MNg5tMrEEZnBOBuXNHWOA6cWZ2mVHyqAqy5902QVXjQuADfDTa
	FjLmZBnM+ld51CWIcT/1sDPHHKSP+DDHeJW57IM+TvaLWsfoseZEfNUtNjAlS+pi
	9jxNWzT5jyZTWr06p4kc2eBME22hGa0ju0stzwpMyY+qY/v7HHcs7Wv8pVBmuyUE
	d2163ZYt8oynYY6rPHZt0b8nAIkCVBOU1XqCtJ6H2H6J7bBLeraUaV+EuSmPY2p/
	ODrGLBWyO46RnmhEkLlUo1ai/Ca+7RkDRriy1Okd5fVvpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tsmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so772929985a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462523; x=1796067323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=evuPWXBg2S1HDs02kVAFSafa1UPDJ/qwUXhXw4tcKqyhkg5WJz+fJ9pxPHc/oXbUUa
         QeyVeMnGivjh87mhEFVW16GXiiTEns6O2+61ZSlsQiCKTu1M8MUm/QtcAOpj8f9fgsbC
         tSQvql/i9k8TOGkxuZZCMmig4n47F67fYOTO7eeLA53Nh3ZVaCgPm7lVOzgPoi8LihK8
         S3cXpxzm0L8jjgQzmL44gLOI+59swUHL3dg/6wvBV5waJaLKp0M0Gi2AcLClC8+5/UJP
         xNgaX8iGcxnpdDKoZiHe3IyJlFXDY2wjIPtPcolCB+AAuNO0X0PrwR0f4sQenwuzmyAN
         sEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462523; x=1796067323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=UQ/6uODvrjeZ4zqsGdYI4rRimGlIUn2mZIxz3Kzjr2YLridA/z92DGlPbmm+fU0IO9
         RjimfT7tdjNIjtIwDk7U76m2dSY9/Lu4LhQoPZq/tDdafxHNrhXslz19qcBSSW9vdTfP
         hjgxbickGIVP302QiHIenSrgI9CcKMpTDn6Bzv+3z8do4rk/M7tGLKHW2UBF31W8f+vk
         n89TstsHuedziv//Htf2C4+ZlguL/OF5hDHYdHDcyg2D2TDdkOQhErqWD2q2VkH9ghRG
         oFSuvOK2qxVNAxDf1y8kEIn4v/cVv65lIYmSHsvzz0KBQZWCdoHMPiW0inug4ggb5MCa
         S84w==
X-Forwarded-Encrypted: i=1; AL+hErEoRaKpoh+C58ntaQ4FYGUoBdoGOz0B+7J3Kaz1w+de/cE2gNDC2S9mPz0TalKeZnmD+aEISWYOWJ+v@vger.kernel.org
X-Gm-Message-State: APuU4Z/1f109W32TGybCVFPFF/sgsIbM+hBSZ7wC3PDkSi45hRlE8AUb
	5PfhXoqCbhxwFAi0hNhN3kQRksCRKfPZCKrtToJQkg9be/GFLD7/lR/mPbaPcZYngD4FZ64sMlO
	mtstRUukyu5rdEBeZs60Q/7Uj1DystQftC1+blhf5uUvzIYTXZP+db6hF6xICJAn6
X-Gm-Gg: AZFdTZfRaP+VhqlIfXQgrdvty8CoM2MIUOYcq9HP/i1FWH7njxsxHggzFvMSCC3FkKH
	SE1rIrOSjgHituaS8Yk8HCjWkLw7wzQdXzSDANvKxjBkrsV1DlCCwZu/6nC9CN6GCsqmnLZh7RC
	FZNMbmpCSpwYXbo6VEjICHcp8XRQkYLJPY/ppzS4fjGYhSwzS70TCrHi7auDp/3IYVK+ug8i2Zg
	wFhRC7Mo2k9iXXf7UzpTbdOV2OH5p0ss1GrKLSmIAY9SPHX8LLSAhap3JwfsqH6/YxvS/BT7g5x
	2eT38Opr614UwsFwIILcJL8p2U6r08sbrPHI67dO9wn3FHHj1ydkF4M2Iotci2X4LozzV2ecvko
	82mvMrsBaNJ5amzH/xm01XOCcZAJ4wbJElZChRYkjItuh6KCAowSCW+3EZl8riTmh
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134934585a.8.1795462523325;
        Mon, 23 Nov 2026 11:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134926885a.8.1795462522682;
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184963885e9.3.2026.11.23.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Message-ID: <6ps6o4mexhrbmcodgl3yze2pobq2vzao4lrbhqomhrc2vbfjb4@zmuby52sku6s>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04957c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IQcQmC8h3zhotARXj3UA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXzkwc9rlWgpBY
 Lvhp07+65Mgvuzp8MvUcTghrxG57OS0WI2k5yEwStSz4E4DnZJ5cbKBx2nVvim1THet+VctZo3g
 8Pu68Whim8ViQaUTTfAbLhjLkZRW0BCYd6cSjL6Svom6mCbvFp6cfchjdx9Gr5AJsJIUC3xga/7
 OI05Os5jLv71uo4aon7zK7WzCqnBv64sAiCApc/A/TySxRYwaY0kMwTstbRgXZp9AtP+k3Q+7rm
 6IHCCtsfYGET0oahBHKK29+ORKKLJ5XINLAvvx14S0tl98eIEDrrplqDza/l9VDCKSOcVADXwTK
 KAJigwM+2ZrjU821JSBgSyXfeI7Xsok4M9qUdXMSSKZr6u9YXLJR5SSVzF6GdgwkowAiQZMyYJf
 Gwc3h7QVqhZ/Qwv/8xaKEw4b6fRERDzgtgILSQjzIu9IMbRYRpf7/VXCZWfAOHYlEISzJrPzKXL
 35zBsEdgqFTEdBTCBlQ==
X-Proofpoint-GUID: arpMRxljAVSnYc5dLbnbi9Zo2LDtpsFL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX+O2f9T84RtZD
 DGXcS5GFKgzT8H0r4EZOCqIhEkyKlb4p6OMU8w8/YiPaPHrMLlXhI/i05rtrT17RkUoFmSr1Iqb
 OLf9LLzt0/lpenk5hhuq9uTNIfw07vk=
X-Proofpoint-ORIG-GUID: arpMRxljAVSnYc5dLbnbi9Zo2LDtpsFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-22 16:14:35, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
> buses on the same WSA Playback link. One MM1 playback open brings up
> both chains via the machine driver's multi_direction_codecs flag; the
> SP<->SP_VI control link in the topology handles the DSP-side pairing.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
